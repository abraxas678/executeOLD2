#!/bin/bash
ts=$(date +"%s")
LAST1h=$(cat /home/abraxas/myq/service/1m/order_ionos1.time1h)
DIFF=$((ts-LAST1h))
echo DIFF $DIFF
if [[ $DIFF -gt "3600" ]]; then
  echo
  /bin/bash $HOME/bin/torrent-move.sh
  echo $ts >/home/abraxas/myq/service/1m/order_ionos1.time1h
  curl -d "1h ionos1 executed" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/order_ionos1/log
fi
