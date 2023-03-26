#!/bin/bash

set -xeuo pipefail

export MSYS=winsymlinks:lnk
export MSYS2_ENV_CONV_EXCL="*"

# configure and build 3dfx wrapper
cd wrappers/3dfx
[ -d build ] && rm -rf build
mkdir build && cd build
bash ../../../scripts/conf_wrapper.sh
make -j$((`nproc`+1))

# configure and build opengl wrapper
cd ../../mesa
[ -d build ] && rm -rf build
mkdir build && cd build
bash ../../../scripts/conf_wrapper.sh
make -j$((`nproc`+1))

cd ..