#!/bin/bash

## download allinone script
cd ~
mkdir workspace
cd workspace
git clone https://gitlab.com/nsnam/ns-3-allinone.git
cd ns-3-allinone
sudo apt install python
sudo apt install python3
python3 download.py

## install bake
cd ~/workspace
git clone https://gitlab.com/nsnam/bake.git
export BAKE_HOME=`pwd`
export PATH=$PATH:$BAKE_HOME:$BAKE_HOME/build/bin
export PYTHONPATH=$PYTHONPATH:$BAKE_HOME:$BAKE_HOME/build/lib
./bake.py configure -e ns-3.30
./bake.py check
sleep 1
sudo apt install build-essential
sudo apt install python3-pip
sudo apt install python-pip
sudo pip3 install mercurial
./bake.py check
./bake.py download

## install dependency
sudo  apt-get install gcc g++ python
sudo  apt-get install gcc g++ python python-dev
sudo  apt-get install mercurial python-setuptools git
sudo  apt-get install qt5-default
sudo  apt-get install python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev ipython
sudo  apt-get install gir1.2-goocanvas-2.0 python-gi python-gi-cairo python-pygraphviz python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython ipython3  
sudo apt-get install openmpi-bin openmpi-common openmpi-doc libopenmpi-dev
sudo  apt-get install autoconf cvs bzr unrar
sudo apt-get install gdb valgrind 
sudo apt-get install uncrustify
sudo  apt-get install doxygen graphviz imagemagick
sudo  apt-get install texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portuguese dvipng latexmk
sudo  apt-get install python-sphinx dia 
sudo  apt-get install gsl-bin libgsl2 libgsl-dev
sudo  apt-get install flex bison libfl-dev
sudo apt-get install tcpdump
sudo apt-get install sqlite sqlite3 libsqlite3-dev
sudo apt-get install libxml2 libxml2-dev
sudo apt-get install cmake libc6-dev libc6-dev-i386 libclang-dev llvm-dev automake
sudo apt-get install python-pip
pip install cxxfilt
sudo  apt-get install libgtk2.0-0 libgtk2.0-dev
sudo  apt-get install vtun lxc
sudo apt-get install libboost-signals-dev libboost-filesystem-dev
sudo pip install pygccxml
sudo apt-get install castxml
sudo apt-get install libgcrypt11-dev libgcrypt20-doc
sudo apt-get install gtk+-3.0

## build ns-3 using bake
./bake.py build


