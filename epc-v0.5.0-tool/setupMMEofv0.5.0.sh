#!/bin/bash

cd ~/openair-cn/scripts
sudo vim /usr/local/etc/oai/mme.conf
sudo vim /usr/local/etc/oai/freeDiameter/mme_fd.conf
sudo ./build_mme  -i
sudo ./build_mme  -c
sudo ./run_mme
