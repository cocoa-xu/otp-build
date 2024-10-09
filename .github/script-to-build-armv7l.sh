#!/bin/sh

set -x

OTP_VERSION=$1
DOCKER_PLATFORM=$2
IMAGE_NAME=$3

sudo docker run --privileged --network=host --rm --platform="${DOCKER_PLATFORM}" -v $(pwd):/work "${IMAGE_NAME}" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${OTP_VERSION} nil armv7l armv7l-linux-gnueabihf"
