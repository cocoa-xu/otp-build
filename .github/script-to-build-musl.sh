#!/bin/sh

set -x

OTP_VERSION=$1
ARCH=$2
IMAGE_NAME=$3
WITH_OPENSSL=$4
OPENSSL_VERSION=$5
WITH_WXWIDGETS=$6
WXWIDGETS_VERSION=$7

sudo docker run --privileged --network=host --rm -v $(pwd):/work --platform=linux/$ARCH "${IMAGE_NAME}" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${OTP_VERSION} ${ARCH}-linux-musl ${ARCH} ${WITH_OPENSSL} ${OPENSSL_VERSION} ${WITH_WXWIDGETS} ${WXWIDGETS_VERSION}"
