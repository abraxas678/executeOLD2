#!/bin/bash
echo; echo START EXECUTE.sh
export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"
echo "exeute.sh_version: 1.02"
source /home/abraxas/bin/path.dat
source /home/abraxas/bin/functions.dat
source /home/abraxas/.zsh.env
ts=$(date +"%s")
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=last_screenshot -ping-key=o4zFWbG--a472NL8pc39jQ -- echo $(hostname); /bin/bash $HOME/bin/last_screenshot.sh >$HOME/bin/last_screenshot.last
#### new sh for ALL
# $(which unison) new -batch

### MOUNT MYQ
#if [[ $(rclone lsf /home/mnt/snas/homes/abraxas/myq/MOUNT_CHECK --files-only | wc -l) = "0" ]]; then
#sudo mkdir /home/mnt/snas >/dev/null 2>/dev/null
#sudo mkdir /home/mnt/snas/homes >/dev/null 2>/dev/null
#[[ ! -f /home/mnt/snas/homes/abraxas/MOUNT_CHECK ]] && sudo chown $myuser: -R /home/mnt/snas
#$RICH -u --print "MOUNT SNAS HOMES"
#echo 'pueue add -g mount -- $HOME/bin/sudo.sh mount -t nfs snas:volume1/homes /home/mnt/snas/homes'
#pueue add -g mount -- $HOME/bin/sudo.sh mount -t nfs snas:volume1/homes/abraxas/myq /home/abraxas/myq
#fi

#cd /home/abraxas/myq/ONCE/ALL
#ts=$(date +"%s")
#COUNT=$(rclone lsf /home/abraxas/myq/ONCE/ALL --include="*.sh" --files-only | wc -l)
#if [[ $COUNT > "0" ]]; then
#   chmod +x *.sh
##   for line in $(rclone lsf  /home/abraxas/myq/ONCE/ALL --include="*.sh" --files-only); do
#     mv /home/abraxas/myq/ONCE/ALL/$line /home/abraxas/myq/ONCE/ALL/process_me/$line$ts.sh
#   done
#fi

#mkdir -p /home/abraxas/myq/ONCE/ALL/done/$(hostname) >/dev/null 2>/dev/null
#cd /home/abraxas/myq/ONCE/ALL/process_me
#COUNT=$(rclone lsf /home/abraxas/myq/ONCE/ALL/process_me --files-only | wc -l)
#if [[ $COUNT > "0" ]]; then
#  for line in $(rclone lsf /home/abraxas/myq/ONCE/ALL/process_me --files-only); do
#     if [[ $(rclone lsf /home/abraxas/myq/ONCE/ALL/done/$(hostname)/$line | wc -l) = "0" ]]; then
#       /bin/bash /home/abraxas/myq/ONCE/ALL/process_me/$line
#       mv /home/abraxas/myq/ONCE/ALL/process_me/$line /home/abraxas/myq/ONCE/ALL/done/$(hostname)/$line 
#     fi
#  done
#fi

curl -d "execute.sh" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
curl -d "$(hostname)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/execute

/bin/bash /home/abraxas/bin/stats.sh
/usr/bin/unison new -batch

echo IONOS2
if [[ $(hostname) = *"ionos2"* ]]; then
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=ionos2b -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -sL https://raw.githubusercontent.com/abraxas678/execute/master/ionos2b.sh)
fi

echo IONOS1
if [[ $(hostname) = *"ionos1"* ]]; then
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=ionos1b -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -sL https://raw.githubusercontent.com/abraxas678/execute/master/ionos1b.sh)
fi

### ever 1h all machines
[[ ! -f /home/abraxas/tmp/$(hostname)/execute.sh.1h.dat ]] && mkdir -p /home/abraxas/tmp/$(hostname)/ && echo $ts >/home/abraxas/tmp/$(hostname)/execute.sh.1h.dat
TS_OLD=$(cat /home/abraxas/tmp/$(hostname)/execute.sh.1h.dat)
TS_DIFF=$(($ts-$TS_OLD))
echo TS_DIFF $TS_DIFF
curl -d "$(hostname) $ts $TS_OLD $TS_DIFF" https://n.yyps.de/alert
if [[ $TS_DIFF -gt "3600" ]]; then
   echo 3600
   curl -d "$(hostname) -----3600---- $ts $TS_OLD $TS_DIFF" https://n.yyps.de/alert
   $(which pueue) add -- unison new -batch; $(which pueue) add -- unison new-downloads -batch   
   echo $ts >/home/abraxas/tmp/$(hostname)/execute.sh.1h.dat
fi


exit



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

echo; echo ENDE EXECUTE.sh
exit

ts=$(date +"%s")
echo $ts 


exit

#LAST=$(cat $HOME/tmp/execute.sh.last)
#DIFF=$(($ts-$LAST))
#curl -d "$(hostname) DIFF execute: $DIFF" https://n.yyps.de/alert
#echo   RUNITOR
#runitor -every=0 -api-url=https://hc-ping.com -slug=test -ping-key=o4zFWbG--a472NL8pc39jQ test
#echo order1.sh
#/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=order1 -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -L order1.yyps.de)


#/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=ip -ping-key=o4zFWbG--a472NL8pc39jQ -- dig +short myip.opendns.com @resolver1.opendns.com >/home/abraxas/tmp/$hostname_myip
#cd /home/abraxas/myq/ONCE
#/bin/bash $HOME/bin/git_new_folder.sh
#curl -d "ONCE execute.sh $(hostname) $(ls $(hostname))" https://n.yyps.de/alert
#/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/low-disk-space.sh
#/bin/bash $HOME/bin/wai.sh execute.sh
#rclone copy gdc:rclone/rclone.conf /home/abraxas/.config/rclone/ >rclonelog 2>>rclonelog>
#curl -d "$(hostname) $(cat rclonelog)" https://n.yyps.de/alert

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

