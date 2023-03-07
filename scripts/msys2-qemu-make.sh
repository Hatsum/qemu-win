#!/bin/bash

set -xeuo pipefail

export MSYS=winsymlinks:lnk

# get qemu sources
[ ! -f qemu-7.2.0.tar.xz ] && curl -OL https://download.qemu.org/qemu-7.2.0.tar.xz
[ -d qemu-7.2.0 ] && rm -rf qemu-7.2.0
tar xf qemu-7.2.0.tar.xz
cd qemu-7.2.0

# patch qemu with qemu-3dfx patch
rsync -r ../qemu-0/hw/3dfx ./hw/
rsync -r ../qemu-1/hw/mesa ./hw/
patch -p0 -i ../00-qemu720-mesa-glide.patch
patch -p0 -i ../virgil3d/0001-Virgil3D-with-SDL2-OpenGL.patch

# add commit hash to qemu version number
bash ../scripts/sign_commit.sh

# configure and build
mkdir ../build 
cd ../build
../qemu-7.2.0/configure --disable-guest-agent-msi --disable-werror --target-list=i386-softmmu,x86_64-softmmu
make

cd ..