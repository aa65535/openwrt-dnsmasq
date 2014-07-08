OpenWrt Dnsmasq 防DNS污染 Patch
===

Dnsmasq Patch 根据 [styx-hy][1] 的 [dnsmasq-chinadns][2] 制作

适用于 [dnsmasq 2.71-3][3] 版本 (15a68f7f6cc0119e843f67d2f79598f1)

使用说明
---

```
# 删除旧的 Patch & Makefile
rm -rf package/network/services/dnsmasq
# 下载新的 Patch & Makefile
git clone https://github.com/aa65535/openwrt-dnsmasq-chinadns.git package/network/services/dnsmasq
# 开始编译
make package/network/services/dnsmasq/compile V=99
```


  [1]: https://github.com/styx-hy
  [2]: https://github.com/styx-hy/dnsmasq-chinadns
  [3]: http://thekelleys.org.uk/dnsmasq/dnsmasq-2.71.tar.gz