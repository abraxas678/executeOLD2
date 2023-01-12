#!/bin/bash
ts=$(date +"%s")
LAST1h=$(cat /home/abraxas/myq/service/1m/order_ionos1.time1h)
DIFF=$((ts-LAST1h))
echo DIFF $DIFF
if [[ $DIFF -gt "3600" ]]; then
  echo
  echo $ts >/home/abraxas/myq/service/1m/order_ionos1.time1h
fi
