#!/bin/bash
rm 1m-execute-setup.tar -f
mkdir /home/abraxas/myq >/dev/null 2>/dev/null
mkdir /home/abraxas/myq/service >/dev/null 2>/dev/null
mv 1m.sh /home/abraxas/myq/service
sudo mv ./1m* /etc/systemd/system
$HOME/bin/sudo.sh systemctl start 1m.timer
$HOME/bin/sudo.sh systemctl enable 1m.timer
