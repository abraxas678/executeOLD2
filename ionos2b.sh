#!/bin/bash
echo; echo IONOS2b
/bin/bash $HOME/bin/sudo.sh chown abraxas: -R /home/abraxas
echo 
echo IONOS2
LASTio2=$(cat $HOME/tmp/execute.sh.ionos2.last)
DIFFio2=$((ts-LASTio2))
echo
echo LASTio2 $LASTio2
echo DIFFio2 $DIFFio2
echo
if [[ $(hostname) = *"ionos2"* ]]; then
 source /home/abraxas/bin/path.dat
 echo
 echo MOVE TELE
 echo "========="
 #curl -d "move tele from razer" https://n.yyps.de/alert
 # /bin/bash /home/abraxas/bin/move_tele_from_razer.sh
 source /home/abraxas/bin/move_tele_from_razer.sh
 echo; echo MOVE RAD FAVORITES
 echo "=================="
 [[ $(ps aux) != *"rclone move rad:mp4_favourites"* ]] && rclone move rad:mp4_favourites gdc:Videos/favourites --update --fast-list -P
 # curl -d "ionos2 execute.sh DIFFio2: $DIFFio2" https://n.yyps.de/alert
    export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"
    echo; echo MOVE TORRENT 1
    /usr/bin/rclone move rad: gd:torrent-new --include="*.torrent" -P >>/home/abraxas/tmp/torrentmove 2>>/home/abraxas/tmp/torrentmove
### 15min
  if [[ $DIFFio2 -gt "900" ]] && [[ $DIFFio2 -lt "970" ]]; then
     echo; echo MOVE TORRENT 2
     /usr/bin/rclone move rad: gd:torrent-new --include "*.torrent" -P
     SIZE_RAD_TELE=$(/usr/bin/rclone size rad:Telegram\ Desktop)
     SIZE_GDCV=$(/usr/bin/rclone size gdcv:)
     SIZE_RAD=$(/usr/bin/rclone size rad:)
     curl -H "Content-Type: application/json" -X POST -d '{ \"size_gdcv\":\"$SIZE_GDCV\",\"size_rad\":\"$SIZE_RAD\",\"size_rad_tele\":\"$SIZE_RAD_TELE\" }' 'https://main-pocketbase.mi04yg.easypanel.host/api/collections/stats/records'
     curl -d "SIZE_RAD_TELE $SIZE_RAD_TELE \n SIZE_GDCV $SIZE_GDCV \n SIZE_RAD $SIZE_RAD" -H "title: stats" https://n.yyps.de/alert
  fi
### 5min
  if [[ $DIFFio2 -gt "300" ]] && [[ $DIFFio2 -lt "370" ]]; then
       echo; echo MOVE TORRENT 3
      /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=rclone -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move rad: gd:torrent-new --include="*.torrent" -P
#     /usr/bin/rclone move rad: gd:torrent-new --include "*.torrent" -P 
  fi
### 1h
  if [[ $DIFFio2 -gt "3600" ]]; then
     echo; echo MOVE PUT
     /bin/bash $HOME/bin/move-put.sh
     echo; echo UPLOAD RAD
     rclone copy rad: gd:a_downloads --update --fast-list -P
     echo; echo MOVE RAD GD
     rclone move rad: gd:a_downloads --exclude="*.mp4" --update --fast-list -P --min-age 3d
     echo $ts >$HOME/tmp/execute.sh.ionos2.last
  fi
fi
echo; echo ENDE IONOS2b
