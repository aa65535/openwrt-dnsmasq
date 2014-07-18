OpenWrt's Dnsmasq Patch & Makefile
===

编译时默认从 [dnsmasq][1] 下载最新源码

添加 **防 DNS 污染 Patch**, 根据 [dnsmasq-chinadns][2] 制作

添加 **pos-ttl** 选项, 设置 DNS 的最小 TTL 时间, 单位为秒

使用说明
---

编译 OpenWrt 平台的 IPK

```
# 删除旧的 Patch & Makefile
rm -rf package/network/services/dnsmasq
# 下载新的 Patch & Makefile
git clone https://github.com/aa65535/openwrt-dnsmasq.git package/network/services/dnsmasq
# 选择要编译的包
make menuconfig
# 开始编译
rm dl/master.zip
make package/network/services/dnsmasq/compile V=99
```

同样可以将 Patch 应用到 [dnsmasq][1] 后编译出其他平台的可执行文件

```
# 下载代码
git clone https://github.com/aa65535/dnsmasq.git
git clone https://github.com/aa65535/openwrt-dnsmasq.git
# 打 Patch
cd dnsmasq
patch -p1 < ../openwrt-dnsmasq/patches/001-add-suspicious-ip-filtering-function.patch
patch -p1 < ../openwrt-dnsmasq/patches/011-add-pos-ttl-option.patch
patch -p1 < ../openwrt-dnsmasq/patches/111-add-version-info.patch
# 开始编译
make
```

  [1]: https://github.com/aa65535/dnsmasq
  [2]: https://github.com/styx-hy/dnsmasq-chinadns
