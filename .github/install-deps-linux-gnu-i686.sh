#!/bin/bash

set -xe

export DEBIAN_FRONTEND=noninteractive

if [ -z "$(which sudo)" ]; then
  export SUDO="" ;
else
  export SUDO="sudo" ;
fi

${SUDO} apt-get update
${SUDO} apt-get install -y gcc g++ perl libncurses5-dev make build-essential curl
