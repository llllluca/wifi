#!/bin/bash

set -ex

VERSION=$(grep 'VERSION' Makefile | \
    head -n 1 | awk '{ print $3 }')
BIN=debian/bin
DEBIAN=debian/DEBIAN

mkdir -p ${BIN}
mkdir -p ${DEBIAN}
cp wifi ${BIN}/wifi
chmod 755 ${BIN}/wifi
cat << EOF > debian/DEBIAN/control
Package: wifi
Version: ${VERSION}
Depends: network-manager
Section: utils
Priority: optional
Architecture: all
Maintainer: Luca <luca.orlandello@gmail.com>
Description: Simple command line frontend for NetworkManager
EOF
dpkg-deb --build debian
mv debian.deb wifi_${VERSION}-debian.deb


