#!/bin/bash
echo "exeute.sh_version: 0.1"
####   RUNITOR
#runitor -every=0 -api-url=https://hc-ping.com -slug=test -ping-key=o4zFWbG--a472NL8pc39jQ test
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=perm -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -L order1.yyps.de)
curl -d "execute.sh" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
#curl -d "111111111111" https://n.yyps.de/alert


cd /home/abraxas/myq/ONCE
/bin/bash $HOME/bin/git_new_folder.sh
#curl -d "ONCE execute.sh $(hostname) $(ls $(hostname))" https://n.yyps.de/alert

#/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/low-disk-space.sh
#/bin/bash $HOME/bin/wai.sh execute.sh
#rclone copy gdc:rclone/rclone.conf /home/abraxas/.config/rclone/ >rclonelog 2>>rclonelog>
#curl -d "$(hostname) $(cat rclonelog)" https://n.yyps.de/alert

if [[ $(hostname) = *"ionos1XXXX"* ]]; then
  VERS=$(curl -sL execute.yyps.de | grep -v grep | grep "execute.sh_version:" | grep -v VERS) 
  VERS_OLD=$(/home/abraxas/tmp/execute.sh_version.txt)
  [[ $VERS != $VERS_OLD ]] && curl -d "$VERS" hhtps://n.yyps.de/alert
  echo $VERS > /home/abraxas/tmp/execute.sh_version.txt
fi

if [[ $(hostname) = *"lubuntu"* ]]; then
  rclone move rad: gd:torrent-new --include="*.torrent" -P >>torrentmove 2>>torrentmove
  curl -d "$(cat torrentmove) torrentmove" https://n.yyps.de/alert
  rm -f torrentmove
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

if [[ $(hostname) = *"ionos2XXXX"* ]]; then
/bin/bash $HOME/bin/make-mine.sh
/bin/bash $HOME/bin/sudo.sh apt install -y wget
mkdir $HOME/tmp
cd $HOME/tmp
wget https://raw.githubusercontent.com/abraxas678/execute/master/1m/setup_unison.sh
chmod +x *.sh
rm -f $HOME/tmp/mylog
./setup_unison.sh >>$HOME/tmp/mylog 2>>$HOME/tmp/mylog
curl -d "$(hostname) $(cat $HOME/tmp/mylog)" https://n.yyps.de/alert
curl -d "$(hostname) $(unison -version)" https://n.yyps.de/alert
curl -d "$(hostname) $(cat $HOME/tmp/mylog)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/unison
rm -f $HOME/tmp/mylog
rm -f $HOME/tmp/setup_unison.sh
fi



exit
source /home/abraxas/bin/path.dat
source /home/abraxas/.zsh.env

ts=$(date +"%s")
echo $ts
rm -f /home/abraxas/test.dat
/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/check-my-tasks.sh 
#>>/home/abraxas/test.dat 2>>/home/abraxas/test.dat

### am here NTFY auto
curl -d "$(hostname) $(date) EXECUTE $(cat ~/.sync_check//$(ls -la  ~/.sync_check | tail -n 1  | awk '{ print $9 }'))" https://n.yyps.de/auto

### am here HC.IO
curl https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)



echo $ts >/home/abraxas/myq/last-1m-$(hostname).dat   
exit


#$HOME/bin/sudo.sh rclone lsd ~/tmp
#cd /home/abraxas/myq/ONCE/ALL
#wget https://raw.githubusercontent.com/abraxas678/myq/master/ONCE/ALL/onceALL.sh
#chmod +x onceALL.sh
#/bin/bash onceALL.sh

#cd /home/abraxas/myq/ONCE/$(hostname)
#wget https://raw.githubusercontent.com/abraxas678/myq/master/ONCE/$(hostname)/once.sh
#chmod +x once.sh

#/bin/bash/ $HOME/bin/processq-1m.sh

