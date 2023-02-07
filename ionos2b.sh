#!/bin/bash

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
 /bin/bash /home/abraxas/bin/move_tele_from_razer.sh
 [[ $(ps aux) != *"rclone move rad:mp4_favourites"* ]] && rclone move rad:mp4_favourites gdc:Videos/favourites --update --fast-list -P
 # curl -d "ionos2 execute.sh DIFFio2: $DIFFio2" https://n.yyps.de/alert
    export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"
    /usr/bin/rclone move rad: gd:torrent-new --include="*.torrent" -P >>/home/abraxas/tmp/torrentmove 2>>/home/abraxas/tmp/torrentmove
  if [[ $DIFFio2 -gt "900" ]] && [[ $DIFFio2 -lt "970" ]]; then
     /usr/bin/rclone move rad: gd:torrent-new --include "*.torrent" -P 
  fi
  if [[ $DIFFio2 -gt "300" ]] && [[ $DIFFio2 -lt "370" ]]; then
      /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=rclone -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move rad: gd:torrent-new --include="*.torrent" -P
#     /usr/bin/rclone move rad: gd:torrent-new --include "*.torrent" -P 
  fi
  if [[ $DIFFio2 -gt "3600" ]]; then
     /bin/bash $HOME/bin/move-put.sh
     rclone copy rad: gd:a_downloads --update --fast-list -P
     rclone move rad: gd:a_downloads --exclude="*.mp4" --update --fast-list -P --min-age 3d
     echo $ts >$HOME/tmp/execute.sh.ionos2.last
  fi
fi
