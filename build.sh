#!/bin/bash

VERSION="3.3.1"

wget https://github.com/Genymobile/scrcpy/archive/refs/tags/v${VERSION}.tar.gz
tar -xzf v${VERSION}.tar.gz
cd scrcpy-${VERSION}
sed -i '21d' install_release.sh
./install_release.sh
cd ..

# copy control file
mkdir scrcpy
cp -r DEBIAN scrcpy/

# copy share folder
mkdir scrcpy/usr
cp -r share scrcpy/usr/

# copy scrcpy binary
mkdir scrcpy/usr/bin
cp scrcpy-${VERSION}/build-auto/app/scrcpy scrcpy/usr/bin/

# copy share folder
cp -R share scrcpy/usr/

# copy scrcpy server file
mkdir -p scrcpy/usr/local/share/scrcpy/
cp scrcpy-${VERSION}/scrcpy-server scrcpy/usr/local/share/scrcpy/

# build deb file
dpkg -b scrcpy
