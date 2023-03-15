#!/bin/bash

set -xeuo pipefail

# install dependencies
pacman -S --needed --noconfirm \
  ${MINGW_PACKAGE_PREFIX}-meson \
  ${MINGW_PACKAGE_PREFIX}-ninja \
  ${MINGW_PACKAGE_PREFIX}-make \
  ${MINGW_PACKAGE_PREFIX}-autotools \
  ${MINGW_PACKAGE_PREFIX}-tools-git \
  ${MINGW_PACKAGE_PREFIX}-cc \
  ${MINGW_PACKAGE_PREFIX}-gcc \
  ${MINGW_PACKAGE_PREFIX}-gcc-libs \
  ${MINGW_PACKAGE_PREFIX}-zlib \
  ${MINGW_PACKAGE_PREFIX}-mpfr \
  ${MINGW_PACKAGE_PREFIX}-mpc \
  ${MINGW_PACKAGE_PREFIX}-gmp \
  ${MINGW_PACKAGE_PREFIX}-isl \
  ${MINGW_PACKAGE_PREFIX}-gperf

# install djgpp
cd buildenv/djgpp-binutils
gpg --recv-keys 13FCEF89DD9E3C4F
makepkg-mingw -sCf
pacman --noconfirm -U ${MINGW_PACKAGE_PREFIX}-djgpp-binutils*.pkg.tar.zst

cd ../djgpp-djcrx-bootstrap
makepkg-mingw -sCf
pacman --noconfirm -U ${MINGW_PACKAGE_PREFIX}-djgpp-djcrx-bootstrap*.pkg.tar.zst

cd ../djgpp-gcc
gpg --recv-keys 3AB00996FC26A641
makepkg-mingw -sCf
pacman --noconfirm -U ${MINGW_PACKAGE_PREFIX}-djgpp-gcc*.pkg.tar.zst

cd ../..