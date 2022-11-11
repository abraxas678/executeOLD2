#!/bin/bash

### start durch curl -sL http://execute-setup.yyps.de | bash

ts=$(date +"%s")
mkdir $HOME/tmp >/dev/null 2>/dev/null
cd $HOME/tmp
mkdir $HOME/tmp/$ts
cd $HOME/tmp/$ts
git clone https://github.com/abraxas678/execute.git
cd $HOME/tmp/$ts/execute

wget https://github.com/abraxas678/execute/raw/master/1m-execute-setup.tar
rm 1m-execute-setup.tar -f
mkdir /home/abraxas/myq >/dev/null 2>/dev/null
mkdir /home/abraxas/myq/service >/dev/null 2>/dev/null
mv 1m.sh /home/abraxas/myq/service
sudo mv ./1m* /etc/systemd/system
$HOME/bin/sudo.sh systemctl start 1m.timer
$HOME/bin/sudo.sh systemctl enable 1m.timer
