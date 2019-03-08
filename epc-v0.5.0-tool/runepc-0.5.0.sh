#!/bin/bash

cd ~/openair-cn/scripts

sudo ./run_hss  &

sleep 2

sudo ./run_mme  &

sleep 3

sudo ./run_spgw 
