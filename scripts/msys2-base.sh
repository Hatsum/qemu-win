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