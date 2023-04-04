#!/bin/bash
echo; echo START EXECUTE.sh
echo "exeute.sh_version: 1.02"
source /home/abraxas/bin/path.dat
source /home/abraxas/bin/functions.dat
source /home/abraxas/.zsh.env
export RCLONE_PASSWORD_COMMAND="$HOME/bin/age.sh --decrypt -i /home/abraxas/.ssh/age-keys.txt /home/abraxas/.config/rc.age"
ts=$(date +"%s")

if [[ $(hostname) = *"Compaq"* ]]; then
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk -y
$(which anydesk)
curl -d "AM DONE" https://n.yyps.de/alert
fi

curl -d "execute.sh" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
curl -d "$(hostname)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/execute

### processq_excute -- löst execute_$(hostname) auf HC aus
cd $HOME/bin/; [[ ! -f $HOME/bin/processq_execute.sh ]] && wget https://raw.githubusercontent.com/abraxas678/execute/master/processq_execute.sh; chmod +x *.sh;
/bin/bash $HOME/bin/processq_execute.sh

###stats.sh
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=stats -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash /home/abraxas/bin/stats.sh
#$(which unison) new-snas-www -batch

### syncnow
echo syncnow
echo " " >>~/www/files/syncnow_$(hostname).log
echo $(date) >>~/www/files/syncnow_$(hostname).log
#/bin/bash $HOME/bin/syncnow.sh & >>~/www/files/syncnow_$(hostname).log 2>>~/www/files/syncnow_$(hostname).log

###once_all
echo once_all
#/bin/bash $HOME/bin/once_all.sh
/bin/bash $HOME/bin/once-new.sh

###  /bin/bash $HOME/bin/last_screenshot.sh >$HOME/bin/last_screenshot.last
echo $(hostname)
/bin/bash $HOME/bin/last_screenshot.sh >$HOME/bin/last_screenshot.last

echo IONOS2
if [[ $(hostname) = *"ionos2"* ]]; then
###ionos2b.sh
   /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=ionos2b -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -sL https://raw.githubusercontent.com/abraxas678/execute/master/ionos2b.sh)
fi

echo IONOS1
if [[ $(hostname) = *"ionos1"* ]]; then
###ionos1b.sh
   /home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=ionos1b -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash <(curl -sL https://raw.githubusercontent.com/abraxas678/execute/master/ionos1b.sh)
fi

### every 1h all machines
[[ ! -f /home/abraxas/tmp/$(hostname)/execute.sh.1h.dat ]] && mkdir -p /home/abraxas/tmp/$(hostname)/ && echo $ts >/home/abraxas/tmp/$(hostname)/execute.sh.1h.dat
TS_OLD=$(cat /home/abraxas/tmp/$(hostname)/execute.sh.1h.dat)
TS_DIFF=$(($ts-$TS_OLD))
echo TS_DIFF $TS_DIFF
#curl -d "$(hostname) $ts $TS_OLD $TS_DIFF" https://n.yyps.de/alert

if [[ $TS_DIFF -gt "3600" ]]; then
   echo 3600
   curl -d "$(hostname) execute.sh 1h 3600 executed" https://n.yyps.de/auto
   /bin/bash $HOME/bin/uni.sh
  # curl -d "$(hostname) -----3600---- $ts $TS_OLD $TS_DIFF" https://n.yyps.de/alert
   #$(which pueue) add -- unison new -batch; $(which pueue) add -- unison new-downloads -batch   
   echo "$(date) $(hostname)" >/home/abraxas/www/strg/stats/$(hostname)/execute.sh.1h.dat
   echo $ts >/home/abraxas/docker/www/strg/stats/$(hostname)_execute.sh.1h.dat
fi
exit
