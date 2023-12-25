#!/bin/sh

set -x

GITHUB_REF_NAME=$1
ARCH=$2

OTP_VERSION=${GITHUB_REF_NAME##v}
OPENSSL_VERSION=${OPENSSL_VERSION:-3.2.0}
PERFIX_DIR="/work/openssl-${OPENSSL_VERSION}-${ARCH}-linux-gnu"
OPENSSL_ARCHIVE="openssl-${OPENSSL_VERSION}-${ARCH}-linux-gnu.tar.gz"

yum install -y ncurses-devel && \
    cd /work && \
    mkdir -p "${PERFIX_DIR}" && \
    tar -C "${PERFIX_DIR}" -xf "${OPENSSL_ARCHIVE}" && \
    tar -xf "otp_src_${GITHUB_REF_NAME}.tar.gz" && \
    cd "otp_src_${OTP_VERSION}" && \
    ./configure --without-javac --with-ssl="${PERFIX_DIR}" --disable-dynamic-ssl-lib && \
    make -j"$(nproc)" && \
    make DESTDIR="$(pwd)/otp_${OTP_VERSION}" install && \
    cd "otp_${OTP_VERSION}" && \
    tar -czf "/work/otp-${ARCH}-linux-gnu.tar.gz" .
