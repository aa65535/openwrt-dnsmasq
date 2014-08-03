OpenWrt's Dnsmasq Patch & Makefile
===

 > 编译时默认从 [dnsmasq][1] 下载最新源码

增强功能
---

 - 添加 `防 DNS 劫持` 功能, 来自 [dnsmasq-chinadns][2]

 - 添加 `--min-cache-ttl` 选项, 设置 DNS 缓存最小有效期

 - 调整 `--cache-size` 选项, 设置范围 0 ~ 65535

编译说明
---

 - OpenWrt 平台的编译, [预编译 IPK 下载][3]

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

 - 同样可以将 Patch 应用到 [dnsmasq][1] 后编译出其他平台的可执行文件

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

 - [/etc/dnsmasq.conf][4]


  [1]: https://github.com/aa65535/dnsmasq
  [2]: https://github.com/styx-hy/dnsmasq-chinadns
  [3]: https://sourceforge.net/projects/openwrt-dist/files/dnsmasq/
  [4]: https://github.com/aa65535/openwrt-dnsmasq/blob/master/files/dnsmasq.conf
