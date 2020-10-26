#!/bin/bash

# 127.0.0.1:1080 is the socket5 port
S5PROT=1080
HTTP_PORT=8118

sudo apt install privoxy
echo "add the following:"
echo "forward-socks5 / 127.0.0.1:$S5PORT ."
sleep(1)
sudo vim /etc/privoxy/config
sudo systemctl restart privoxy
# 8118 is the default port of privoxy
http_proxy=http://localhost:$HTTP_PORT curl http://www.google.com
