#!/bin/sh
# Build Erlang/OTP inside a *BSD VM.
#
# This script is executed as a *file* inside the guest VM (the repo is synced
# into the VM at the same path). Running a file avoids feeding the build
# commands to the guest sh line-by-line over the vmactions SSH stdin, which
# intermittently drops trailing characters on heavy output (observed as
# `gmake` -> `gma`, `install` -> `inst`, or "Unexpected end of line in
# substitution"). Keeping everything in one file makes the build deterministic.

set -e

OS="$1"            # freebsd | netbsd | openbsd
TRIPLET="$2"       # e.g. x86_64-unknown-freebsd
OTP_VERSION="$3"

ROOT_DIR="$(pwd)"
SRC_DIR="${ROOT_DIR}/otp_src_${OTP_VERSION}"
DESTDIR="${SRC_DIR}/otp_${OTP_VERSION}"

case "${OTP_VERSION}" in
  24.* | 23.*)
    OPENSSL_PREFIX_DIR="/tmp/openssl-${OPENSSL_VERSION_OTP_24_AND_BELOW}-${TRIPLET}"
    OPENSSL_ARCHIVE="openssl-${OPENSSL_VERSION_OTP_24_AND_BELOW}-${TRIPLET}.tar.gz"
    ;;
  *)
    OPENSSL_PREFIX_DIR="/openssl-${OPENSSL_VERSION}-${TRIPLET}"
    OPENSSL_ARCHIVE="openssl-${OPENSSL_VERSION}-${TRIPLET}.tar.gz"
    ;;
esac

if [ "${OS}" = "openbsd" ]; then
  TAR="gtar"
else
  TAR="tar"
fi

if [ "${OS}" = "freebsd" ]; then
  NPROC="$(sysctl -n hw.ncpu)"
else
  NPROC="$(getconf NPROCESSORS_ONLN)"
fi

mkdir -p "${OPENSSL_PREFIX_DIR}"
${TAR} -C "${OPENSSL_PREFIX_DIR}" -xzf "${OPENSSL_ARCHIVE}"
rm -f "${OPENSSL_ARCHIVE}"

rm -rf "${SRC_DIR}"
mkdir -p "${SRC_DIR}"
${TAR} -xzf "otp_src_${OTP_VERSION}.tar.gz" -C "${SRC_DIR}" --strip-components=1
rm -f "otp_src_${OTP_VERSION}.tar.gz"

cd "${SRC_DIR}"
./configure --without-javac --with-ssl="${OPENSSL_PREFIX_DIR}" --disable-dynamic-ssl-lib
gmake -j"${NPROC}"
gmake DESTDIR="${DESTDIR}" install

cd "${DESTDIR}"
${TAR} -czf "${ROOT_DIR}/otp-${TRIPLET}.tar.gz" .

cd "${ROOT_DIR}"
rm -rf "${SRC_DIR}"
ls -lah "${ROOT_DIR}"
