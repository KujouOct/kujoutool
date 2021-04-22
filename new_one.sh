#!/bin/bash
id=VfSqV56CjG6RRdj
system=`cat /etc/issue | grep "16.04"`
cd changeSource
if [ -z "$system" ]; then
	system=`cat /etc/issue | grep "18.04"`
	if [ -z "$system" ]; then
		system=`cat /etc/issue | grep "20.04"`
		if [-z "$system" ]; then
			echo "not supported system version"
		else
			#echo "20.04"
			sudo ./changeSource-2004.sh
		fi
	else
		#echo "18.04"
		sudo ./changeSource-1804.sh
        fi
else
	#echo "16.04"
	sudo ./changeSource-1604.sh
fi

sudo apt update

sudo apt install curl
sudo apt install vim
sudo apt install subversion git
sudo apt install net-tools
sudo apt install lrzsz
sudo apt install w3m
sudo apt install openssh-server
sudo apt install htop lm-sensors
sudo git config --global user.email "874864293@qq.com"
sudo git config --global user.name "kujou"
curl http://confluence.opensource5g.org/pages/viewpage.action?pageId=2588744 -d "machineID= $id"
echo "machine $id init finished"
