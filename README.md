OpenWrt Dnsmasq 防DNS污染 Patch
===

Dnsmasq Patch 根据 [dnsmasq-chinadns][1] 制作

默认从 [dnsmasq][2] 下载最新源码进行编译

若应用于 [dnsmasq releases][3] 版本 请于 [releases][4] 下载对应版本

使用说明
---

```
# 删除旧的 Patch & Makefile
rm -rf package/network/services/dnsmasq
# 下载新的 Patch & Makefile
git clone https://github.com/aa65535/openwrt-dnsmasq-chinadns.git package/network/services/dnsmasq
# 选择要编译的包
make menuconfig
# 开始编译
rm dl/master.zip
make package/network/services/dnsmasq/compile V=99
```


  [1]: https://github.com/styx-hy/dnsmasq-chinadns
  [2]: https://github.com/aa65535/dnsmasq
  [3]: http://thekelleys.org.uk/dnsmasq
  [4]: https://github.com/aa65535/openwrt-dnsmasq-chinadns/releases