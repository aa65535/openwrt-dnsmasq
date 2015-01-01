Dnsmasq Config
===

此配置需要搭配 `ss-tunnel` 使用  
dnsmasq 会自动载入 `/etc/dnsmasq.d` 中的配置文件  

 文件名               | 简介
----------------------|-------------------------------
`address-custom.conf` | 自定义域名 IP, 目前只有广告屏蔽列表   
`server-custom.conf`  | 强制指定域名的 DNS 查询走 ss 流量   
`ignore-address.conf` | GFW 返回的污染 IP 地址   
