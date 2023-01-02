#!/bin/bash

### start durch curl -sL http://execute-setup.yyps.de | bash

ts=$(date +"%s")
mkdir $HOME/tmp >/dev/null 2>/dev/null
cd $HOME/tmp
mkdir $HOME/tmp/$ts
cd $HOME/tmp/$ts
git clone https://github.com/abraxas678/execute.git
cd $HOME/tmp/$ts/execute
rm -rf ./1m/
mv ./1h/* .

#wget https://github.com/abraxas678/execute/raw/master/1m-execute-setup.tar
#rm 1m-execute-setup.tar -f
mkdir /home/abraxas/myq >/dev/null 2>/dev/null
mkdir /home/abraxas/myq/service >/dev/null 2>/dev/null
mv 1h.sh /home/abraxas/myq/service
sudo mv ./1h* /etc/systemd/system
$HOME/bin/sudo.sh systemctl start 1h.timer
$HOME/bin/sudo.sh systemctl enable 1h.timer
cd ..
rm -rf execute
