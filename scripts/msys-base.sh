#!/bin/bash

set -xeuo pipefail

# Update and install base packages
pacman  -S --needed --noconfirm \
  curl \
  wget \
  git \
  patch \
  rsync \
  base-devel \
  bison \
  flex \
  texinfo \
  ninja \
  meson \
  make \
  unzip \
  nano \
  vim

# Install sudo
mkdir gsudo
cd gsudo
curl -OL https://github.com/gerardog/gsudo/releases/download/v2.0.4/gsudo.v2.0.4.zip
unzip gsudo.v2.0.4.zip
[ $MSYSTEM_CARCH == "x86_64" ] && mv x64 /opt/gsudo || mv x86 /opt/gsudo
cd ..
rm -rf gsudo
echo 'export PATH="$PATH:/opt/gsudo"' >> $HOME/.bashrc
echo 'gsudo() { MSYS_NO_PATHCONV=1 gsudo.exe "$@"; }' >> $HOME/.bashrc