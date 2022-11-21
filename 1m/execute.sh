#!/bin/bash

source /home/abraxas/bin/path.dat
source /home/abraxas/.zsh.env

ts=$(date +"%s")

#$HOME/bin/sudo.sh rclone lsd ~/tmp
#cd /home/abraxas/myq/ONCE/ALL
#wget https://raw.githubusercontent.com/abraxas678/myq/master/ONCE/ALL/onceALL.sh
#chmod +x onceALL.sh
#/bin/bash onceALL.sh
rm -f /home/abraxas/test.dat
/home/abraxas/bin/runitor -slug $(hostname)flex /home/abraxas/bin/check-my-tasks.sh >>/home/abraxas/test.dat 2>>/home/abraxas/test.dat

#cd /home/abraxas/myq/ONCE/$(hostname)
#wget https://raw.githubusercontent.com/abraxas678/myq/master/ONCE/$(hostname)/once.sh
#chmod +x once.sh

#/bin/bash/ $HOME/bin/processq-1m.sh

### am here NTFY auto
curl -d "$(hostname) $(date) EXECUTE $(cat ~/.sync_check//$(ls -la  ~/.sync_check | tail -n 1  | awk '{ print $9 }'))" https://n.yyps.de/auto

### am here HC.IO
curl https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)

/bin/bash $HOME/bin/low-disk-space.sh

echo $ts >/home/abraxas/myq/last-1m-$(hostname).dat   
exit
