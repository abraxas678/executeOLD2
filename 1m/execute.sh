#!/bin/bash
echo v 1.01
source /home/abraxas/bin/path.dat
source /home/abraxas/.zsh.env
ts=$(date +"%s")
echo "exeute.sh_version: 0.2"
LAST=$(cat $HOME/tmp/execute.sh.last)
DIFF=$(($ts-$LAST))
#curl -d "$(hostname) DIFF execute: $DIFF" https://n.yyps.de/alert
echo   RUNITOR
#runitor -every=0 -api-url=https://hc-ping.com -slug=test -ping-key=o4zFWbG--a472NL8pc39jQ test
echo order1.sh
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=perm -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -L order1.yyps.de)
curl -d "execute.sh" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
curl -d "$(hostname)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/execute


#/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=ip -ping-key=o4zFWbG--a472NL8pc39jQ -- dig +short myip.opendns.com @resolver1.opendns.com >/home/abraxas/tmp/$hostname_myip
#cd /home/abraxas/myq/ONCE
#/bin/bash $HOME/bin/git_new_folder.sh
#curl -d "ONCE execute.sh $(hostname) $(ls $(hostname))" https://n.yyps.de/alert
#/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/low-disk-space.sh
#/bin/bash $HOME/bin/wai.sh execute.sh
#rclone copy gdc:rclone/rclone.conf /home/abraxas/.config/rclone/ >rclonelog 2>>rclonelog>
#curl -d "$(hostname) $(cat rclonelog)" https://n.yyps.de/alert

echo IONOS1
if [[ $(hostname) = *"ionos1"* ]]; then
 /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=order_ionos1 -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -L https://raw.githubusercontent.com/abraxas678/execute/master/1m/order_ionos1.sh)
 # VERS=$(curl -sL execute.yyps.de | grep -v grep | grep "execute.sh_version:" | grep -v VERS) 
 # VERS_OLD=$(/home/abraxas/tmp/execute.sh_version.txt)
 # [[ $VERS != $VERS_OLD ]] && curl -d "$VERS" hhtps://n.yyps.de/alert
 # echo $VERS > /home/abraxas/tmp/execute.sh_version.txt
fi

echo LUBUNTU
if [[ $(hostname) = *"lubuntu"* ]]; then
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=special -ping-key=o4zFWbG--a472NL8pc39jQ tmate
#curl -d "$(hostname) DIFF execute: $DIFF" https://n.yyps.de/alert
  if [[ $DIFF -gt "300" ]]; then
    export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"
   /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=lubuntu -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move rad: gd:torrent-new --include="*.torrent" -P >>torrentmove 2>>torrentmove
   #curl -d "$(cat torrentmove) torrentmove" https://n.yyps.de/alert
    rm -f torrentmove
    echo $ts >$HOME/tmp/execute.sh.last
  fi
fi

### SOFTWARE INSTALL
#[[ $(which nnn) = *"nnn not found"* ]] && /bin/bash $HOME/bin/sudo.sh apt install nnn -y

#rm -f $HOME/tmp/mylog
#/bin/bash $HOME/bin/list-timer.sh >>$HOME/tmp/mylog 2>>$HOME/tmp/mylog
#curl -d "$(hostname) $(cat $HOME/tmp/mylog | grep '1m.timer')" https://n.yyps.de/alert
#curl -d "$(hostname) $(cat $HOME/bin/create_nfo.sh | grep TEMP)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/timer

#curl -d "$(hostname) $(cat $HOME/bin/create_nfo.sh | grep TEMP)" https://maker.ifttt.com/trigger/round-robin-result-json/with/key/4q38KZvz7CwD5_QzdUZHq
#curl -d "$(hostname) EXECUTE.SH" https://n.yyps.de/alert

#curl -d "$(hostname) $(cat $HOME/tmp/mylog | grep '1m.timer')" https://n.yyps.de/alert

#rm -f $HOME/tmp/mylog

#### CHOWN
#$HOME/bin/sudo.sh chown abraxas: $HOME/bin/pueue-status.sh
LASTio2=$(cat $HOME/tmp/execute.sh.ionos2.last)
DIFFio2=$((ts-LASTio2))
if [[ $(hostname) = *"ionos2"* ]]; then
 # curl -d "ionos2 execute.sh DIFFio2: $DIFFio2" https://n.yyps.de/alert
    export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"
    /usr/binrclone move rad: gd:torrent-new --include="*.torrent" -P >>/home/abraxas/tmp/torrentmove 2>>/home/abraxas/tmp/torrentmove
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

if [[ $(hostname) = *"wsl22"* ]]; then
  mkdir $HOME/tmp >/dev/null 2>/dev/null
  /usr/bin/rclone size /mnt/c/Users/abrax/Downloads --json | jq .bytes >$HOME/tmp/dsize
  if [[ "$(cat $HOME/tmp/dsizeold)" != "$(cat $HOME/tmp/dsize)" ]]; then
    /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=wsl22 -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move /mnt/c/Users/abrax/Downloads/ gd:torrent-new --include="*.torrent" -P 
  fi
  mv $HOME/tmp/dsize $HOME/tmp/dsizeold -f
  TOLD=$(cat $HOME/tmp/wsl22_1h)
  TDIFF=$((ts-TOLD))
  if [[ $TDIFF -gt "3600" ]]; then
     /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=wsl22 -ping-key=o4zFWbG--a472NL8pc39jQ rclone copy  /mnt/c/Users/abrax/Downloads gd:a_downloads --update -P --fast-list
     /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=wsl22 -ping-key=o4zFWbG--a472NL8pc39jQ rclone move /mnt/c/Users/abrax/Downloads gd:a_downloads --update -P --fast-list --min-age 4d
     /usr/bin/pueue add -- /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=wsl22 -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move nas:Public/Dropbox/A_Waistedold gdc:Videos/Dropbox/A_Waistedold -P --update --fast-list -L          
     /usr/bin/pueue add -- /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=wsl22 -ping-key=o4zFWbG--a472NL8pc39jQ /usr/bin/rclone move nas:Public/GREAT gdc:Videos/GREAT -P --update --fast-list -L          
     echo $ts >$HOME/tmp/wsl22_1h
  fi
fi

exit

ts=$(date +"%s")
echo $ts 
