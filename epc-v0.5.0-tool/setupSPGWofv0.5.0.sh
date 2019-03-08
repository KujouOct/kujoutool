#!/bin/bash

cd ~/openair-cn/scripts
sudo vim /usr/local/etc/oai/spgw.conf
sudo ./build_spgw -i
sudo ./build_spgw -c
sudo ./run_spgw

