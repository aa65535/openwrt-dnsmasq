OpenWrt Dnsmasq 防DNS污染 Patch
===

本 Dnsmasq Patch 根据 [styx-hy][1] 的 [dnsmasq-chinadns][2] 制作

使用说明
---

```
# 删除自带的 Patch & Makefile
rm -rf package/network/services/dnsmasq
# 下载新的 Patch & Makefile
git clone https://github.com/aa65535/openwrt-dnsmasq-chinadns.git package/network/services/dnsmasq
# 开始编译
make package/network/services/dnsmasq/compile V=99
```


  [1]: https://github.com/styx-hy
  [2]: https://github.com/styx-hy/dnsmasq-chinadns