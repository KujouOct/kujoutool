#!/bin/bash

YOURNAME='xumingze'
while :
do
  stillRunning=$(ps -A | grep "run_hss" |grep -v "grep")
  if [ "$stillRunning" ] ; then
    echo "HSS was already started by another way" 
  else
    pkill -9 hss
    pkill -9 mme
    pkill -9 spgw
    echo "HSS was not started" 
    echo "Starting service ..." 
    /home/$YOURNAME/openair-cn/scripts/run_hss &
	sleep 2
    /home/$YOURNAME/openair-cn/scripts/run_mme &
	sleep 2    
    /home/$YOURNAME/openair-cn/scripts/run_spgw &  
fi
  
  sleep 2  

  stillRunning=$(ps -A | grep "run_mme" |grep -v "grep")
  if [ "$stillRunning" ] ; then
    echo "MME was already started by another way" 
    
  else
    pkill -9 hss
    pkill -9 mme
    pkill -9 spgw
    echo "MME was not started" 
    echo "Starting service ..." 
    /home/$YOURNAME/openair-cn/scripts/run_hss &
    sleep 2
    /home/$YOURNAME/openair-cn/scripts/run_mme &
    sleep 2
    /home/$YOURNAME/openair-cn/scripts/run_spgw & 
  fi

  sleep 2

  stillRunning=$(ps -A | grep "run_spgw" |grep -v "grep")
  if [ "$stillRunning" ] ; then
    echo "SPGW was already started by another way" 

  else
    pkill -9 hss
    pkill -9 mme
    pkill -9 spgw
    echo "SPGW was not started" 
    echo "Starting service ..." 
    /home/$YOURNAME/openair-cn/scripts/run_hss &
    sleep 2
    /home/$YOURNAME/openair-cn/scripts/run_mme &
    sleep 2
    /home/$YOURNAME/openair-cn/scripts/run_spgw &
    
  fi
  sleep 6
done

