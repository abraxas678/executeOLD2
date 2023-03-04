#!/bin/bash
echo IONOS1b.sh
 $HOME/bin/last_screenshot.sh >$HOME/bin/last_screenshot.last
 LAST_PBBACKUP=$(curl -sk --request GET -H 'Content-Type: application/json' --url https://pocket.yyps.de/api/collections/smarthome/records | jq '.items[] | "\(.pbbackup)"' | sed 's/\"//g')
 ts=$(date +"%s")
 DIFF=$((ts-LAST_PBBACKUP))
 echo DIFF $DIFF
 #curl -d $DIFF https://n.yyps.de/alert
 if [[ $DIFF -gt "3600" ]]; then
   echo DIFF IF LOOP ENTERED
   # curl -d "execute.sh ionos1 3600 $DIFF" https://n.yyps.de/alert
    cd /home/abraxas/docker/pocketbase/data
    /usr/bin/git commit -a -m auto
    /usr/bin/git push
    /usr/bin/restic backup /home/abraxas/docker/pocketbase/data --tag pb,keep -r rclone:gd:restic2
    /usr/bin/rclone copy /home/abraxas/docker/pocketbase/data snas:docker/pocketbase/data -P
    curl -L https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/pbbackup
    curl -k --request PATCH -H 'Content-Type: application/json' -d "{\"pbbackup\": \"$ts\"}" --url https://pocket.yyps.de/api/collections/smarthome/records/h1jnz8ntuhkbfjl
 fi
 # VERS=$(curl -sL execute.yyps.de | grep -v grep | grep "execute.sh_version:" | grep -v VERS) 
 # VERS_OLD=$(/home/abraxas/tmp/execute.sh_version.txt)
 # [[ $VERS != $VERS_OLD ]] && curl -d "$VERS" hhtps://n.yyps.de/alert
 # echo $VERS > /home/abraxas/tmp/execute.sh_version.txt

