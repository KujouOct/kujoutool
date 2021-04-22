YOURPWD=/home/ubuntu/kujoutool
while :
do
  stillRunning=$(ps -ef |grep "$YOURPWD/frp/frpc" |grep -v "grep")
  if [ "$stillRunning" ] ; then
    echo "TWS service was already started by another way" 
    echo "Kill it and then startup by this shell, other wise this shell will loop out this message annoyingly" 
    kill -9 $pidof $YOURPWD/frp/frpc 
  else
    echo "Starting service ..." 
    $YOURPWD/frp/frpc -c $YOURPWD/frp/frpc.ini
  fi
  sleep 20
done
