#!/bin/bash

set -xeuo pipefail

# install openwatcom
cd buildenv/openwatcom-v2
makepkg -sCf
pacman --noconfirm -U openwatcom-v2*.pkg.tar.zst

cd ../..