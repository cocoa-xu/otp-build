#!/bin/sh

set -xe

export DEBIAN_FRONTEND=noninteractive

if [ -z "$(which sudo)" ]; then
  export SUDO="" ;
else
  export SUDO="sudo" ;
fi

OTP_VERSION=$1
TARGET=$2
ARCH=$3
WITH_OPENSSL=$4
OPENSSL_VERSION=$5
WITH_WXWIDGETS=$6
WXWIDGETS_VERSION=$7

cd /work
export ROOTDIR="$(pwd)"
export OTP_SRC="otp_src_${OTP_VERSION}"
export OTP_SRC_DIR="${ROOTDIR}/${OTP_SRC}"
export DESTDIR="${ROOTDIR}/otp_${OTP_VERSION}"
export RELDIR="${ROOTDIR}/rel/otp_${OTP_VERSION}"

rm -rf "${OTP_SRC_DIR}"
mkdir -p "${OTP_SRC_DIR}"
rm -rf "${DESTDIR}"
mkdir -p "${DESTDIR}"
rm -rf "${ROOTDIR}/build"
mkdir -p "${ROOTDIR}/build"

export OPENSSL_ARCHIVE="openssl-${TARGET}.tar.gz"
export OPENSSL_PERFIX_DIR="/work/openssl-${TARGET}"

mkdir -p "${OPENSSL_PERFIX_DIR}"
${SUDO} tar -C "${OPENSSL_PERFIX_DIR}" -xzf "${OPENSSL_ARCHIVE}"
if [ "${WITH_OPENSSL}" != "static" ]; then
  find "${OPENSSL_PERFIX_DIR}" -name "*.so"  -exec rm {} \;
fi

if [ "${WITH_WXWIDGETS}" != "false" ]; then
  export WXWIDGETS_ARCHIVE="wxWidgets-${WITH_WXWIDGETS}-${TARGET}.tar.gz"
  ${SUDO} tar -C "/usr/local" -xf "${WXWIDGETS_ARCHIVE}" --strip-components=3

  /usr/local/bin/wx-config --version
fi

case $TARGET in
  i686-* | i386-* | armv7l-* )
    CONFIGURE_OPTIONS="--disable-year2038"
    ;;
  * )
    CONFIGURE_OPTIONS=""
    ;;
esac

tar -xzf "otp_src_${OTP_VERSION}.tar.gz" -C "otp_src_${OTP_VERSION}" --strip-components=1
cd "otp_src_${OTP_VERSION}"

if [ "${OPENSSL_VERSION}" != "nil" ]; then
  ./otp_build configure --without-javac --with-ssl="${OPENSSL_PERFIX_DIR}" --disable-dynamic-ssl-lib ${CONFIGURE_OPTIONS} ;
else
  ./otp_build configure --without-javac --with-ssl="${OPENSSL_PERFIX_DIR}" --disable-dynamic-ssl-lib ${CONFIGURE_OPTIONS} ;
fi

rm -rf "${RELDIR}"
./otp_build boot -a
./otp_build release -a "${RELDIR}"
cd "${RELDIR}"
./Install -sasl "$(pwd)"
tar -czf "${ROOTDIR}/build/otp-release-${TARGET}.tar.gz" .

cd "${OTP_SRC_DIR}"
make -j"$(nproc)"
make DESTDIR="${DESTDIR}" install
cd "${DESTDIR}"
tar -czf "${ROOTDIR}/build/otp-${TARGET}.tar.gz" .

cd "${ROOTDIR}/build"
sha256sum "otp-${TARGET}.tar.gz" | tee "otp-${TARGET}.tar.gz.sha256"
sha256sum "otp-release-${TARGET}.tar.gz" | tee "otp-release-${TARGET}.tar.gz.sha256"
