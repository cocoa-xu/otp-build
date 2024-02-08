#!/bin/sh

set -x

OTP_VERSION=$1
OPENSSL_VERSION=$2
ARCH=$3
IMAGE_NAME=$4

sudo docker run --privileged --network=host --rm -v $(pwd):/work --platform=linux/$ARCH "${IMAGE_NAME}" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${OTP_VERSION} ${OPENSSL_VERSION} ${ARCH} ${ARCH}-linux-musl"
