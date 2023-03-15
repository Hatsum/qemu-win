#!/bin/bash

set -xeuo pipefail

export MSYS=winsymlinks:lnk

cd build
[ -d ../qemu-bin ] && rm -rf ../qemu-bin
mkdir -p ../qemu-bin
ldd qemu-bundle/msys2/qemu/*.exe | awk '{print $3}' | grep mingw64 | sort -u | xargs -I {} cp {} ../qemu-bin
rsync -r -L qemu-bundle/msys2/qemu/*.exe qemu-bundle/msys2/qemu/share --exclude={"locale","man"} ../qemu-bin

cd ..