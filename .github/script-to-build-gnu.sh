#!/bin/sh

set -x

OTP_VERSION=$1
ARCH=$2
IMAGE_NAME="quay.io/pypa/manylinux2014_$ARCH:latest"

if [ "${ARCH}" = "riscv64" ]; then
    IMAGE_NAME="riscv64/ubuntu:22.04"
fi

sudo docker run --privileged --network=host --rm -v `pwd`:/work "${IMAGE_NAME}" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${OTP_VERSION} ${ARCH} ${ARCH}-linux-gnu"
