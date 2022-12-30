#!/bin/bash

#/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/low-disk-space.sh
#/bin/bash $HOME/bin/wai.sh execute.sh
#rclone copy gdc:rclone/rclone.conf /home/abraxas/.config/rclone/ >rclonelog 2>>rclonelog
#curl -d "$(hostname) $(cat rclonelog)" https://n.yyps.de/alert
curl 	https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
[[ $(which nnn) = *"nnn not found"* ]] && /bin/bash $HOME/bin/sudo.sh apt install nnn -y

rm -f $HOME/tmp/mylog
#/bin/bash $HOME/bin/list-timer.sh >>$HOME/tmp/mylog 2>>$HOME/tmp/mylog
#curl -d "$(hostname) $(cat $HOME/tmp/mylog | grep '1m.timer')" https://n.yyps.de/alert
curl -d "$(hostname) $(cat $HOME/bin/create_nfo.sh | grep TEMP)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/timer
#rm -f $HOME/tmp/mylog
$HOME/bin/sudo.sh chown abraxas: $HOME/bin/pueue-status.sh

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

