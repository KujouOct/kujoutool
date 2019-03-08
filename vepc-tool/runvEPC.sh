#!/bin/bash

sudo ./ensup.sh

sudo ./runhss &

sleep 2

sudo ./runmme &

sleep 2

sudo ./runspgw 
