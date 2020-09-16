#!/bin/bash

# MME
# ens33 192.168.176.128  ----S1---- virbr0 (vmnet8) 192.168.176.1
# ens33:9 ----S6A---- HSS ens33:12
sudo ifconfig ens33:9 172.66.1.111/16 up

sudo ifconfig ens39:10 192.168.2.111 up

sudo ifconfig ens33:11 192.168.111.111 up

# HSS
sudo ifconfig ens33:12 172.66.1.113/16 up

# SPGW  
# ens33:15 192.168.28.227 ----S1U---- virbr2 (vmnet1) 192.168.28.1

sudo ifconfig ens39:14 192.168.2.114 up

