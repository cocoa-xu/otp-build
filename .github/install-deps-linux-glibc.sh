#!/bin/bash

set -xe

export DEBIAN_FRONTEND=noninteractive

if [ -z "$(which sudo)" ]; then
  export SUDO="" ;
else
  export SUDO="sudo" ;
fi

${SUDO} apt-get update
${SUDO} apt-get install -y gcc g++ perl libncurses5-dev make build-essential curl \
  libgtk-3-dev libwebkit2gtk-4.0-dev liblzma-dev libcurl4-openssl-dev libnotify-dev \
  libsecret-1-dev libgspell-1-dev libgl1-mesa-dev libglu1-mesa-dev
