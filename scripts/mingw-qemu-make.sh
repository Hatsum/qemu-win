#!/bin/bash

set -xeuo pipefail

export MSYS=winsymlinks:lnk

DL_QEMU_SRC=1
RM_QEMU_TAR=1

for i in "$@"; do
  case $i in
    -r|--rm-qemu-tar)
      RM_QEMU_TAR=0
      shift # past argument with no value
      ;;
    -d|--dl-qemu-src)
      DL_QEMU_SRC=0
      shift # past argument with no value
      ;;
    -*|--*)
      echo "Unknown option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

# get qemu sources
if [[ $DL_QEMU_SRC -eq 0 || ! -d qemu-7.2.0 ]] ; then
  [ ! -f qemu-7.2.0.tar.xz ] && curl -OL https://download.qemu.org/qemu-7.2.0.tar.xz
  [ -d qemu-7.2.0 ] && rm -rf qemu-7.2.0
  tar xf qemu-7.2.0.tar.xz
  [ $RM_QEMU_TAR -eq 0 && -f qemu-7.2.0.tar.xz ] && rm -rf qemu-7.2.0.tar.xz
  cd qemu-7.2.0

  # patch qemu with qemu-3dfx patch
  rsync -r ../qemu-0/hw/3dfx ./hw/
  rsync -r ../qemu-1/hw/mesa ./hw/
  patch -p0 -i ../00-qemu720-mesa-glide.patch
  patch -p0 -i ../virgil3d/0001-Virgil3D-with-SDL2-OpenGL.patch
  patch -p0 -i ../virgil3d/0002-Virgil3D-macOS-GLSL-version.patch

  # add commit hash to qemu version number
  bash ../scripts/sign_commit.sh
else
  cd qemu-7.2.0
fi

# configure and build
[ -d ../build ] && rm -rf ../build
mkdir ../build 
cd ../build
# as admin only :(
gsudo ../qemu-7.2.0/configure \
    --without-default-features \
    --enable-avx2 \
    --enable-bochs \
    --enable-bzip2 \
    --enable-capstone \
    --enable-cloop \
    --enable-curl \
    --enable-curses \
    --enable-dmg \
    --enable-dsound \
    --enable-gnutls \
    --enable-guest-agent \
    --enable-hax \
    --enable-iconv \
    --enable-libnfs \
    --enable-libssh \
    --enable-libusb \
    --enable-live-block-migration \
    --enable-lzo \
    --enable-opengl \
    --enable-parallels \
    --enable-png \
    --enable-qcow1 \
    --enable-qed \
    --enable-qga-vss \
    --enable-replication \
    --enable-sdl \
    --enable-sdl-image \
    --enable-slirp \
    --enable-snappy \
    --enable-spice \
    --enable-spice-protocol \
    --enable-system \
    --enable-tcg \
    --enable-tools \
    --enable-usb-redir \
    --enable-vdi \
    --enable-virglrenderer \
    --enable-vvfat \
    --enable-whpx \
    --enable-zstd \
    --disable-werror \
    --target-list=i386-softmmu,x86_64-softmmu
make -j$((`nproc`+1))

cd ..