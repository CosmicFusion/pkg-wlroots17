#! /bin/bash

# Clone Upstream
git clone https://gitlab.freedesktop.org/wlroots/wlroots -b 0.17.0
cp -rvf ./debian ./wlroots
cd ./wlroots

# Get build deps
apt-get build-dep ./ -y

LOGNAME=root dh_make --createorig -y -l -p ./wlroots_0.17.1

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
