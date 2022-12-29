#!/bin/bash

#/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/low-disk-space.sh
#/bin/bash $HOME/bin/wai.sh execute.sh
#rclone copy gdc:rclone/rclone.conf /home/abraxas/.config/rclone/ >rclonelog 2>>rclonelog
#curl -d "$(hostname) $(cat rclonelog)" https://n.yyps.de/alert
curl 	https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
[[ $(which nnn) = *"nnn not found"* ]] && /bin/bash $HOME/bin/sudo.sh apt install nnn -y



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

