#!/bin/bash

set -xeuo pipefail

# install qemu build dependencies
pacman -S --needed --noconfirm \
  ${MINGW_PACKAGE_PREFIX}-meson \
  ${MINGW_PACKAGE_PREFIX}-ninja \
  ${MINGW_PACKAGE_PREFIX}-nsis \
  ${MINGW_PACKAGE_PREFIX}-python \
  ${MINGW_PACKAGE_PREFIX}-python-sphinx \
  ${MINGW_PACKAGE_PREFIX}-python-sphinx_rtd_theme \
  ${MINGW_PACKAGE_PREFIX}-autotools \
  ${MINGW_PACKAGE_PREFIX}-tools-git \
  ${MINGW_PACKAGE_PREFIX}-cc

# install qemu dependencies
pacman -S --needed --noconfirm \
  ${MINGW_PACKAGE_PREFIX}-bzip2 \
  ${MINGW_PACKAGE_PREFIX}-capstone \
  ${MINGW_PACKAGE_PREFIX}-curl \
  ${MINGW_PACKAGE_PREFIX}-cyrus-sasl \
  ${MINGW_PACKAGE_PREFIX}-expat \
  ${MINGW_PACKAGE_PREFIX}-fontconfig \
  ${MINGW_PACKAGE_PREFIX}-freetype \
  ${MINGW_PACKAGE_PREFIX}-fribidi \
  ${MINGW_PACKAGE_PREFIX}-gcc-libs \
  ${MINGW_PACKAGE_PREFIX}-gdk-pixbuf2 \
  ${MINGW_PACKAGE_PREFIX}-gettext \
  ${MINGW_PACKAGE_PREFIX}-glib2 \
  ${MINGW_PACKAGE_PREFIX}-gmp \
  ${MINGW_PACKAGE_PREFIX}-gnutls \
  ${MINGW_PACKAGE_PREFIX}-graphite2 \
  ${MINGW_PACKAGE_PREFIX}-gst-plugins-base \
  ${MINGW_PACKAGE_PREFIX}-gstreamer \
  ${MINGW_PACKAGE_PREFIX}-gtk3 \
  ${MINGW_PACKAGE_PREFIX}-harfbuzz \
  ${MINGW_PACKAGE_PREFIX}-jbigkit \
  ${MINGW_PACKAGE_PREFIX}-lerc \
  ${MINGW_PACKAGE_PREFIX}-libc++ \
  ${MINGW_PACKAGE_PREFIX}-libdatrie \
  ${MINGW_PACKAGE_PREFIX}-libdeflate \
  ${MINGW_PACKAGE_PREFIX}-libepoxy \
  ${MINGW_PACKAGE_PREFIX}-libffi \
  ${MINGW_PACKAGE_PREFIX}-libgcrypt \
  ${MINGW_PACKAGE_PREFIX}-libiconv \
  ${MINGW_PACKAGE_PREFIX}-libidn2 \
  ${MINGW_PACKAGE_PREFIX}-libjpeg-turbo \
  ${MINGW_PACKAGE_PREFIX}-libnfs \
  ${MINGW_PACKAGE_PREFIX}-libpng \
  ${MINGW_PACKAGE_PREFIX}-libpsl \
  ${MINGW_PACKAGE_PREFIX}-libslirp \
  ${MINGW_PACKAGE_PREFIX}-libssh \
  ${MINGW_PACKAGE_PREFIX}-libssh2 \
  ${MINGW_PACKAGE_PREFIX}-libtasn1 \
  ${MINGW_PACKAGE_PREFIX}-libthai \
  ${MINGW_PACKAGE_PREFIX}-libtiff \
  ${MINGW_PACKAGE_PREFIX}-libunistring \
  ${MINGW_PACKAGE_PREFIX}-libunwind \
  ${MINGW_PACKAGE_PREFIX}-libusb \
  ${MINGW_PACKAGE_PREFIX}-libwebp \
  ${MINGW_PACKAGE_PREFIX}-libwinpthread-git \
  ${MINGW_PACKAGE_PREFIX}-libxml2 \
  ${MINGW_PACKAGE_PREFIX}-lz4 \
  ${MINGW_PACKAGE_PREFIX}-lzo2 \
  ${MINGW_PACKAGE_PREFIX}-nettle \
  ${MINGW_PACKAGE_PREFIX}-openssl \
  ${MINGW_PACKAGE_PREFIX}-opus \
  ${MINGW_PACKAGE_PREFIX}-orc \
  ${MINGW_PACKAGE_PREFIX}-p11-kit \
  ${MINGW_PACKAGE_PREFIX}-pango \
  ${MINGW_PACKAGE_PREFIX}-pcre \
  ${MINGW_PACKAGE_PREFIX}-pixman \
  ${MINGW_PACKAGE_PREFIX}-SDL2 \
  ${MINGW_PACKAGE_PREFIX}-SDL2_image \
  ${MINGW_PACKAGE_PREFIX}-snappy \
  ${MINGW_PACKAGE_PREFIX}-spice \
  ${MINGW_PACKAGE_PREFIX}-usbredir \
  ${MINGW_PACKAGE_PREFIX}-xz \
  ${MINGW_PACKAGE_PREFIX}-zlib \
  ${MINGW_PACKAGE_PREFIX}-zstd

# build and install virgil dependency
cd virgil3d/MINGW-packages
makepkg-mingw -sCf
pacman --noconfirm -U mingw-w64-x86_64-virglrenderer*.pkg.tar.zst
