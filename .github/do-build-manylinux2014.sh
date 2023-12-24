#!/bin/sh

set -x

OTP_VERSION=$1
ARCH=$2

OPENSSL_VERSION=${OPENSSL_VERSION:-3.2.0}
PERFIX_DIR="/openssl-${ARCH}-linux-gnu"
OPENSSL_ARCHIVE="openssl-${ARCH}-linux-gnu.tar.gz"

yum install -y ncurses-devel && \
    cd / && \
    curl -fSL "https://github.com/cocoa-xu/openssl-build/releases/download/v${OPENSSL_VERSION}/${OPENSSL_ARCHIVE}" -o "${OPENSSL_ARCHIVE}" && \
    tar -C / -xf "${OPENSSL_ARCHIVE}" && \
    curl -fSL "https://github.com/erlang/otp/releases/download/OTP-${OTP_VERSION}/otp_src_${OTP_VERSION}.tar.gz" -o "otp_src_${OTP_VERSION}.tar.gz" && \
    tar -xf "otp_src_${OTP_VERSION}.tar.gz" && \
    cd "otp_src_${OTP_VERSION}" && \
    ./configure --without-javac --with-ssl="${PERFIX_DIR}" --disable-dynamic-ssl-lib && \
    make -j"$(nproc)" && \
    make DESTDIR="$(pwd)/otp_${OTP_VERSION}" install && \
    cd "otp_${OTP_VERSION}" && \
    tar -czf "/work/otp-${ARCH}-linux-gnu.tar.gz" .
