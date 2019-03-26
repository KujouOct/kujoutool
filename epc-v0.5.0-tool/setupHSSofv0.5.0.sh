#!/bin/bash

cat /etc/hostname

sleep 2

sudo vim /etc/hosts

sudo apt-get update
sudo apt-get install subversion git
echo -n | openssl s_client -showcerts -connect gitlab.eurecom.fr:443 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sudo tee -a /etc/ssl/certs/ca-certificates.crt

sleep 1

cd ~
git config --global http.sslverify false
sudo git clone https://github.com/OPENAIRINTERFACE/openair-cn.git

cd ~/openair-cn
sudo git checkout v0.5.0
sudo git pull

sleep 2

sudo mkdir -p /usr/local/etc/oai/freeDiameter
sudo cp ~/openair-cn/etc/mme.conf /usr/local/etc/oai
sudo cp ~/openair-cn/etc/hss.conf /usr/local/etc/oai
sudo cp ~/openair-cn/etc/spgw.conf /usr/local/etc/oai
sudo cp ~/openair-cn/etc/acl.conf /usr/local/etc/oai/freeDiameter
sudo cp ~/openair-cn/etc/mme_fd.conf /usr/local/etc/oai/freeDiameter
sudo cp ~/openair-cn/etc/hss_fd.conf /usr/local/etc/oai/freeDiameter

sleep 2

cd  ~/openair-cn/scripts
sudo ./check_hss_s6a_certificate /usr/local/etc/oai/freeDiameter/ hss.openair4G.eur
sudo ./check_mme_s6a_certificate /usr/local/etc/oai/freeDiameter/ xmz.openair4G.eur

cd ~/openair-cn
sudo git checkout v0.5.0

cd ~/openair-cn/scripts

sudo ./build_hss -i

sudo apt-get install phpmyadmin
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
sudo /etc/init.d/apache2 reload

sleep 2

sudo vim  /usr/local/etc/oai/hss.conf

cd ~/openair-cn/scripts
sudo ./build_hss -c
sudo ./run_hss -i ~/openair-cn/src/oai_hss/db/oai_db.sql


