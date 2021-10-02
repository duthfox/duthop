#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
sed -i 's/+IPV6:libip6tc//g' package/network/config/firewall/Makefile
sed -i 's/+IPV6:kmod-nf-conntrack6//g' package/network/config/firewall/Makefile
sed -i 's/+IPV6:libip6tc//g' package/network/utils/iptables/Makefile
cp target/linux/ath79/dts/ar9344_netgear_wndr.dtsi target/linux/ath79/dts/ar9344_netgear_wndr_128m.dtsi
sed -i 's/ar9344_netgear_wndr.dtsi/ar9344_netgear_wndr_128m.dtsi/g' target/linux/ath79/dts/ar9344_netgear_wndr_128m.dtsi
sed -i 's/ubiconcat0: partition@ac0000/partition@ac0000/g;s/ubiconcat0/ubi/g;s/0x1500000/0x7500000/g' target/linux/ath79/dts/ar9344_netgear_wndr_128m.dtsi
sed -i 's/0x1900000/0x7900000/g;s/partition@1fc0000/partition@7fc0000/g;s/0x1fc0000/0x7fc0000/g' target/linux/ath79/dts/ar9344_netgear_wndr_128m.dtsi
sed -i 's/netgear_ath79_nand/netgear_ath79_nand_128m/g;s/25600k/121m/g' target/linux/ath79/image/nand.mk
