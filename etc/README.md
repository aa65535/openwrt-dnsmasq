Dnsmasq Config
===

此配置需要搭配 `ss-tunnel` 使用  
dnsmasq 会自动载入 `/etc/dnsmasq.d` 中的配置文件  

 文件名               | 简介
----------------------|-------------------------------
`address-custom.conf` | 自定义域名 IP, 目前只有广告屏蔽列表
`server-custom.conf`  | DNS查询使用 `ss-tunnel` 的域名, 目前只有被污染域名
`ignore-address.conf` | GFW 返回的污染 IP 地址, 已经失效
