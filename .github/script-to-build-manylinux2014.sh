#!/bin/sh

set -x

OTP_VERSION=$1
ARCH=$2

sudo docker run --privileged --network=host --rm -v `pwd`:/work "quay.io/pypa/manylinux2014_$ARCH:latest" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${OTP_VERSION} ${ARCH} ${ARCH}-linux-gnu"
