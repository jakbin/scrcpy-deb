#!/bin/bash

git clone https://github.com/Genymobile/scrcpy scrcpy-git
cd scrcpy-git
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
cp scrcpy-git/build-auto/app/scrcpy scrcpy/usr/bin/

# copy scrcpy server file
mkdir -p scrcpy/usr/local/share/scrcpy/
cp scrcpy-git/scrcpy-server scrcpy/usr/local/share/scrcpy/ 

# build deb file
dpkg -b scrcpy