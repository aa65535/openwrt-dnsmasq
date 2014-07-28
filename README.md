OpenWrt's Dnsmasq Patch & Makefile
===

>编译时默认从 [dnsmasq][1] 下载最新源码

增强功能
---

>添加 `防 DNS 劫持` 功能, 来自 [dnsmasq-chinadns][2]

>添加 `--min-cache-ttl` 选项, 设置 DNS 缓存最小有效期

>调整 `--cache-size` 选项, 设置范围 0 ~ 65535

编译说明
---

OpenWrt 平台的编译, [预编译 IPK 下载][3]

```
# 删除旧的 Patch & Makefile
rm -rf package/network/services/dnsmasq
# 下载新的 Patch & Makefile
git clone https://github.com/aa65535/openwrt-dnsmasq.git package/network/services/dnsmasq
# 选择要编译的包 Base system -> dnsmasq
make menuconfig
# 开始编译 Dnsmasq
rm -f dl/master.zip && make package/network/services/dnsmasq/compile V=99
# 若上面语句编译出错, 使用下面语句编译
make V=99
```

同样可以将 Patch 应用到 [dnsmasq][1] 后编译出其他平台的可执行文件

```
# 下载代码
git clone https://github.com/aa65535/dnsmasq.git
git clone https://github.com/aa65535/openwrt-dnsmasq.git
# 打 Patch
cd dnsmasq
patch -p1 < ../openwrt-dnsmasq/patches/001-feature-enhancement.patch
patch -p1 < ../openwrt-dnsmasq/patches/111-add-version-info.patch
# 开始编译
make
```

配置示例
---
```
# 并发查询所有上游DNS服务器
all-servers
# 本地DNS缓存最小有效期
min-cache-ttl=3600
# 本地DNS缓存数目
cache-size=65535
# 上游DNS服务器, 可设置多个
server=8.8.4.4
#server=8.8.8.8
server=114.114.114.114
#server=208.67.220.220#5353
#server=208.67.222.222#5353
# GWF返回的虚假IP
spurious-ip=74.125.127.102
spurious-ip=74.125.155.102
spurious-ip=74.125.39.102
spurious-ip=74.125.39.113
spurious-ip=209.85.229.138
spurious-ip=128.121.126.139
spurious-ip=159.106.121.75
spurious-ip=169.132.13.103
spurious-ip=192.67.198.6
spurious-ip=202.106.1.2
spurious-ip=202.181.7.85
spurious-ip=203.161.230.171
spurious-ip=203.98.7.65
spurious-ip=207.12.88.98
spurious-ip=208.56.31.43
spurious-ip=209.145.54.50
spurious-ip=209.220.30.174
spurious-ip=209.36.73.33
spurious-ip=211.94.66.147
spurious-ip=213.169.251.35
spurious-ip=216.221.188.182
spurious-ip=216.234.179.13
spurious-ip=243.185.187.39
spurious-ip=37.61.54.158
spurious-ip=4.36.66.178
spurious-ip=46.82.174.68
spurious-ip=59.24.3.173
spurious-ip=64.33.88.161
spurious-ip=64.33.99.47
spurious-ip=64.66.163.251
spurious-ip=65.104.202.252
spurious-ip=65.160.219.113
spurious-ip=66.45.252.237
spurious-ip=72.14.205.104
spurious-ip=72.14.205.99
spurious-ip=78.16.49.15
spurious-ip=8.7.198.45
spurious-ip=93.46.8.89
# 选项可以根据需要添加修改
```

  [1]: https://github.com/aa65535/dnsmasq
  [2]: https://github.com/styx-hy/dnsmasq-chinadns
  [3]: https://sourceforge.net/projects/openwrt-dist/files/dnsmasq/
