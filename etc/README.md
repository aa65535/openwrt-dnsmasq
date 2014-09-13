OpenWrt's Dnsmasq Config
===

此配置需要搭配 `ss-tunnel` 使用  
Dnsmasq 会自动载入 `/etc/dnsmasq.d` 中的配置文件  

 文件名               | 简介
----------------------|-------------------------------
`address-custom.conf` | 自定义域名 IP, 目前只有广告屏蔽列表   
`server-custom.conf`  | 强制指定域名的 DNS 查询走 ss 流量   
`spurious-ips.conf`   | GFW 返回的虚假 IP 列表   

**配置步骤**

  1. 安装 [dnsmasq][0] + [shadowsocks-libev-spec][1]

  2. 根据此配置示例建立 Dnsmasq 配置

  3. 使用 `/etc/init.d/shadowsocks start` 和 `/etc/init.d/dnsmasq start` 启动

  4. enjoy it!

  [0]: https://sourceforge.net/projects/openwrt-dist/files/dnsmasq/
  [1]: https://sourceforge.net/projects/openwrt-dist/files/shadowsocks-libev/
