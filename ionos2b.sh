#!/bin/bash
echo; echo IONOS2b
pb(){
case $1 in
        get)
#         echo get
#          echo "https://pocket.yyps.de/api/collections/$2/records | jq '.items[] | \"\(.$3)"'"
          curl -sk --request GET -H 'Content-Type: application/json' --url https://pocket.yyps.de/api/collections/$2/records | jq ".items[] | \"\(.$3)\"" | sed 's/\"//g'
          ;;

        put)
          echo put
          curl -k --request POST -H 'Content-Type: application/json' -d "{\"$3\": \"$4\"}" --url https://pocket.yyps.de/api/collections/$2/records
          ;;
        put3)
          echo put
          curl -k --request POST -H 'Content-Type: application/json' -d "{\"$3\": \"$4\",\"$5\": \"$6\",\"$7\": \"$8\"}" --url https://pocket.yyps.de/api/collections/$2/records
          ;;
        update)
          echo "-d \"{\\"$3\\": \\"$5\\"}\" --url https://pocket.yyps.de/api/collections/$2/records/$4"
          curl -k --request PATCH -H 'Content-Type: application/json' -d "{\"$3\": \"$5\"}" --url https://pocket.yyps.de/api/collections/$2/records/$4
          ;;
        *)
          $RICH --print '$1 put/get -- $2 collection -- $3 field -- $4 put: field-content' -s "#777777"
          $RICH --print '$1 UPDATE -- $2 collection -- $3 field -- $4 ID  -- $5 put: field-content' -s "#777777"
esac
}
#curl -d "pb test $(pb get scripting ionos215m  | awk '{ print $2 }')" https://n.yyps.de/alert
#COUNTER=$(cat /home/abraxas/docker/www/ionos2b.counter)
#COUNTER=$((COUNTER+1))
#echo COUNTER $COUNTER
/bin/bash $HOME/bin/sudo.sh chown abraxas: -R /home/abraxas
echo 
echo IONOS2
ts=$(date +"%s")

#LASTio2=$(cat $HOME/tmp/execute.sh.ionos2.last)
#DIFFio2=$((ts-LASTio2))
#echo
#echo LASTio2 $LASTio2
#echo DIFFio2 $DIFFio2
echo
LAST15m=$(pb get scripting ionos215m  | awk '{ print $2 }')
LAST1h=$(pb get scripting ionos21h  | awk '{ print $2 }')

DIFF15m=$((ts-LAST15m))
DIFF1h=$((ts-LAST1h))

echo DIFF15m $DIFF15m
echo DIFF1h $DIFF1h

if [[ $(hostname) = *"ionos2"* ]]; then
 source /home/abraxas/bin/path.dat
# echo
# echo MOVE TELE
# echo "========="
 #curl -d "move tele from razer" https://n.yyps.de/alert
 # /bin/bash /home/abraxas/bin/move_tele_from_razer.sh
# source /home/abraxas/bin/move_tele_from_razer.sh
# echo; echo MOVE RAD FAVORITES
## echo "=================="
# [[ $(ps aux) != *"rclone move rad:mp4_favourites"* ]] && rclone move rad:mp4_favourites gdc:Videos/favourites --update --fast-list -P

export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"

### 15min
  if [[ $DIFF15m -gt "900" ]]; then
     echo START 15m
   #  echo; echo "FOLDER SIZES:"
    #       echo "============="
    # SIZE_RAD_TELE=$(/usr/bin/rclone size rad:'Telegram Desktop' --json | jq ".bytes")
    # SIZE_GDCV=$(/usr/bin/rclone size gdcv: --json | jq ".bytes")
   #  SIZE_RAD=$(/usr/bin/rclone size rad: --json | jq ".bytes")
   #  curl -H "Content-Type: application/json" -X POST -d "{ \"size_gdcv\":\"$SIZE_GDCV\",\"size_rad\":\"$SIZE_RAD\",\"size_rad_tele\":\"$SIZE_RAD_TELE\" }" 'https://main-pocketbase.mi04yg.easypanel.host/api/collections/stats/records'
   #  curl -d "SIZE_RAD_TELE $SIZE_RAD_TELE \n SIZE_GDCV $SIZE_GDCV \n SIZE_RAD $SIZE_RAD" -H "title: stats" https://n.yyps.de/alert
    
     echo; echo "MOVE TORRENT:"
           echo "============="
     /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=rclone -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move rad: gd:torrent-new --include="*.torrent" -P
#     /usr/bin/rclone move rad: gd:torrent-new --include "*.torrent" -P
     pb update scripting ionos215m 2595zja8d5mmq2n $ts
  fi


### 1h
  if [[ $DIFF1h -gt "3600" ]]; then
     echo START 1h
     echo; echo MOVE PUT
     /bin/bash $HOME/bin/move-put.sh
     echo; echo UPLOAD RAD
     rclone copy rad: gd:a_downloads --update --fast-list -P
     echo; echo MOVE RAD GD
     rclone move rad: gd:a_downloads --exclude="*.mp4" --update --fast-list -P --min-age 3d
     echo $ts >$HOME/tmp/execute.sh.ionos2.last
     pb update scripting ionos21h 2595zja8d5mmq2n $ts
  fi
fi

#echo $COUNTER >/home/abraxas/docker/www/ionos2b.counter
echo; echo ENDE IONOS2b

