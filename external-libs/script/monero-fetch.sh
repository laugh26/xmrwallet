#!/usr/bin/env bash

set -e

source script/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

url="https://github.com/txchangecoin-project/txchangecoin"
version="release-v0.1.2.0m"

if [ ! -d "txchangecoin" ]; then
  git clone ${url} -b ${version}
  cd txchangecoin
  git submodule update --recursive --init
else
  cd txchangecoin
  git checkout ${version}
  git pull
  git submodule update --recursive --init
fi
