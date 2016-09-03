#!/bin/bash

sudo rm -f bin
git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev
sed -i '/DEPENDS:=/s/$/ +zlib/' package/shadowsocks-libev/Makefile
./scripts/feeds install libopenssl zlib
make defconfig
IGNORE_ERRORS=1 make -j2
find bin -name 'shadowsocks*.ipk' -exec cp {} /tmp \;
tree -F /tmp/
