#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# 修改机器名称
sed -i 's/OpenWrt/newifi3/g' package/base-files/files/bin/config_generate

# 修改默认IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# OpenClash
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# AdGuardHome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# KPR plus+
#git clone https://github.com/project-openwrt/luci-app-koolproxyR.git package/luci-app-koolproxyR

# uci-oaf-app
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# disable usb3.0
git clone https://github.com/rufengsuixing/luci-app-usb3disable.git package/luci-app-usb3disable

# ssr-plus
echo "src-git helloworld https://github.com/fw876/helloworld" >>feeds.conf.default
#git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus

# luci-app-netdata
rm -rf lede/package/lean/luci-app-netdata
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# 其它自定义软件
#git clone https://github.com/kenzok8/openwrt-packages.git
#mv openwrt-packages/luci-app-passwall package/
#rm -rf openwrt-packages

./scripts/feeds update -a
./scripts/feeds install -a

# 更改luci-theme-bootstrap为Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
rm -rf package/lean/luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  

