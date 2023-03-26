#!/bin/bash

set -euo pipefail

export MSYS=winsymlinks:lnk
source /opt/watcom/owsetenv.sh

# configure and build 3dfx wrapper
cd wrappers/3dfx
[ -d build ] && rm -rf build
mkdir build && cd build
bash ../../../scripts/conf_wrapper.sh
make distclean all -j$((`nproc`+1))
make clean

# configure and build opengl wrapper
cd ../../mesa
[ -d build ] && rm -rf build
mkdir build && cd build
bash ../../../scripts/conf_wrapper.sh
make distclean all -j$((`nproc`+1))
make clean

cd ..