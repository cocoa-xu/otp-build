#!/bin/bash

set -xe

DOCKER_PLATFORM=$1
DOCKER_IMAGE=$2
OTP_VERSION=$3
TARGET=$4
ARCH=$5
WITH_OPENSSL=$6
OPENSSL_VERSION=$7
WITH_WXWIDGETS=$8
WXWIDGETS_VERSION=$9

sudo docker run --privileged --network=host --rm \
  --platform="${DOCKER_PLATFORM}" \
  -v $(pwd):/work "${DOCKER_IMAGE}" \
  sh -c "chmod a+x /work/install-deps.sh && /bin/sh /work/install-deps.sh && chmod a+x /work/do-build.sh && /work/do-build.sh ${OTP_VERSION} ${TARGET} ${ARCH} ${WITH_OPENSSL} ${OPENSSL_VERSION} ${WITH_WXWIDGETS} ${WXWIDGETS_VERSION}"
