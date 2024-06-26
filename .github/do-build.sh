#!/bin/sh

set -x

GITHUB_REF_NAME=$1
OPENSSL_VERSION=$2
ARCH=$3
TRIPLET=$4

OTP_VERSION=${GITHUB_REF_NAME##v}
OPENSSL_PERFIX_DIR="/work/openssl-${OPENSSL_VERSION}-${TRIPLET}"
OPENSSL_ARCHIVE="openssl-${OPENSSL_VERSION}-${TRIPLET}.tar.gz"

case $TRIPLET in
    riscv64-linux-gnu )
        apt-get update && apt-get install -y gcc g++ perl libncurses5-dev make
        ;;
    *-linux-gnu )
        yum install -y gcc gcc-c++ perl ncurses-devel make
        ;;
    *-linux-musl )
        apk add gcc g++ perl ncurses-dev make
        ;;
    *)
        echo "Unknown TRIPLET: ${TRIPLET}"
        exit 1
        ;;
esac

case $TRIPLET in
    i686-* | i386-* )
        CONFIGURE_OPTIONS="--disable-year2038"
        ;;
    * )
        CONFIGURE_OPTIONS=""
        ;;
esac

cd /work && \
    mkdir -p "${OPENSSL_PERFIX_DIR}" && \
    tar -C "${OPENSSL_PERFIX_DIR}" -xzf "${OPENSSL_ARCHIVE}" && \
    rm -rf "otp_src_${OTP_VERSION}" && \
    mkdir -p "otp_src_${OTP_VERSION}" && \
    tar -xzf "otp_src_${GITHUB_REF_NAME}.tar.gz" -C "otp_src_${OTP_VERSION}" --strip-components=1 && \
    cd "otp_src_${OTP_VERSION}" && \
    ./configure --without-javac --with-ssl="${OPENSSL_PERFIX_DIR}" --disable-dynamic-ssl-lib ${CONFIGURE_OPTIONS} && \
    make -j"$(nproc)" && \
    make DESTDIR="$(pwd)/otp_${OTP_VERSION}" install && \
    cd "otp_${OTP_VERSION}" && \
    tar -czf "/work/otp-${TRIPLET}.tar.gz" . && \
    cd /work && \
    rm -rf "otp_src_${OTP_VERSION}" "otp_${OTP_VERSION}" "${OPENSSL_PERFIX_DIR}"
