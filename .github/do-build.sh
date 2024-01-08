#!/bin/sh

set -x

GITHUB_REF_NAME=$1
ARCH=$2
TRIPLET=$3

OTP_VERSION=${GITHUB_REF_NAME##v}
OPENSSL_VERSION=${OPENSSL_VERSION:-3.2.0}
OPENSSL_PERFIX_DIR="/work/openssl-${OPENSSL_VERSION}-${TRIPLET}"
OPENSSL_ARCHIVE="openssl-${OPENSSL_VERSION}-${TRIPLET}.tar.gz"

case $TRIPLET in
    riscv64-linux-gnu )
        apt update && apt install -y gcc g++ perl libncurses-dev make
        ;;
    *-linux-gnu )
        ;;
    *-linux-musl )
        apk add gcc g++ perl ncurses-dev make
        ;;
    *)
        echo "Unknown TRIPLET: ${TRIPLET}"
        exit 1
        ;;
esac

cd /work && \
    mkdir -p "${OPENSSL_PERFIX_DIR}" && \
    tar -C "${OPENSSL_PERFIX_DIR}" -xf "${OPENSSL_ARCHIVE}" && \
    tar -xf "otp_src_${GITHUB_REF_NAME}.tar.gz" && \
    cd "otp_src_${OTP_VERSION}" && \
    ./configure --without-javac --with-ssl="${OPENSSL_PERFIX_DIR}" --disable-dynamic-ssl-lib && \
    make -j"$(nproc)" && \
    make DESTDIR="$(pwd)/otp_${OTP_VERSION}" install && \
    cd "otp_${OTP_VERSION}" && \
    tar -czf "/work/otp-${TRIPLET}.tar.gz" .
