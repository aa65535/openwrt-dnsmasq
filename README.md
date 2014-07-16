OpenWrt's Dnsmasq Patch & Makefile
===

编译时默认从 [dnsmasq][1] 下载最新源码

添加 **防 DNS 污染 Patch**, 根据 [dnsmasq-chinadns][2] 制作

添加 **pos-ttl** 选项, 设置 DNS 的最小 TTL 时间, 单位为秒

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


  [1]: https://github.com/aa65535/dnsmasq
  [2]: https://github.com/styx-hy/dnsmasq-chinadns
