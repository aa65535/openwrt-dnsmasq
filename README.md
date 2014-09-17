OpenWrt's Dnsmasq Patch & Makefile
===

 > 编译时默认从 [dnsmasq][1] 下载最新源码

增强功能
---

 - 添加 `DNS 反劫持` 功能, 来自 [dnsmasq-chinadns][2]

 - 添加 `--min-cache-ttl` 选项, 设置 DNS 缓存最小有效期

 - 调整 `--cache-size` 选项, 设置范围 0 ~ 65535

编译说明
---

 - 从 OpenWrt 的 SDK 编译, [预编译 IPK 下载][3]

 > ```
 > # 此处下载 SDK: http://downloads.openwrt.org/snapshots/trunk/
 > # 以 ar71xx 平台为例
 > tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
 > cd OpenWrt-SDK-ar71xx-*
 > # 下载 Patch & Makefile
 > git clone https://github.com/aa65535/openwrt-dnsmasq.git package/dnsmasq
 > # 选择要编译的包 Base system -> dnsmasq
 > make menuconfig
 > # 开始编译
 > make package/dnsmasq/compile V=99
 > ```

 - 同样可以将 Patch 应用到 [dnsmasq][1] 后编译出其他平台的可执行文件

 > ```
 > # 下载代码
 > git clone https://github.com/aa65535/dnsmasq.git
 > git clone https://github.com/aa65535/openwrt-dnsmasq.git
 > # 打 Patch
 > cd dnsmasq
 > patch -p1 < ../openwrt-dnsmasq/patches/001-feature-enhancement.patch
 > # 开始编译
 > make
 > ```

配置示例
---

 - [默认配置文件][4]
 
 - [与 ss-tunnel 搭配][8]

相关项目
---

 Name                     | Description
 -------------------------|-----------------------------------
 [openwrt-chinadns][5]    | OpenWrt's ChinaDNS-C Makefile
 [openwrt-shadowsocks][7] | OpenWrt's ShadowSocks Makefile


  [1]: https://github.com/aa65535/dnsmasq
  [2]: https://github.com/styx-hy/dnsmasq-chinadns
  [3]: https://sourceforge.net/projects/openwrt-dist/files/dnsmasq/
  [4]: https://github.com/aa65535/openwrt-dnsmasq/blob/master/files/dnsmasq.conf
  [5]: https://github.com/aa65535/openwrt-chinadns
  [6]: https://github.com/aa65535/openwrt-dnsmasq
  [7]: https://github.com/aa65535/openwrt-shadowsocks
  [8]: https://github.com/aa65535/openwrt-dnsmasq/tree/master/etc
