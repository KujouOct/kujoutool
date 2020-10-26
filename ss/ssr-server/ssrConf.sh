#!/bin/bash
echo "You can use IPv6 to access Google Scholar by adding"
echo "2404:6800:4008:c06::be scholar.google.com
2404:6800:4008:c06::be scholar.google.com.hk
2404:6800:4008:c06::be scholar.google.com.tw
2401:3800:4001:10::101f scholar.google.com.cn"
echo "to /etc/hosts"
uname -a 
sleep(0.5)
vim /etc/shadowsocks-r/config.json
service shadowsocks-r stop
service shadowsocks-r start
service shadowsocks-r status
