#!/bin/bash
chmod go-w /home/$USER
chmod 700 /home/$USER/.ssh
chmod 644 /home/$USER/.ssh/authorized_keys
chown $USER: /home/$USER/.ssh/authorized_keys
chown $USER: /home/$USER/.ssh
/bin/bash $HOME/bin/sudo.sh service ssh restart
chmod 644 /home/$USER/.ssh/*.pub
chmod 600 /home/$USER/.ssh/id*


$HOME/bin/last_screenshot.sh >$HOME/bin/last_screenshot.last

#❯ cat /etc/resolv.conf
# This file was automatically generated by WSL. To stop automatic generation of this file, add the following entry to /etc/wsl.conf:
# [network]
# generateResolvConf = false
#nameserver 172.31.96.1
#[[ ! -d $HOME/.local/share/dotfiles ]] && rm -rf $HOME/.local/share/dotfiles

curl -s -d "order1.sh" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
#if [[ $(cat /etc/wsl.conf) != *"generateResolvConf = false"* ]]; then
#  $HOME/bin/sudo.sh echo "[network]" >>/etc/wsl.conf
#  $HOME/bin/sudo.sh echo "generateResolvConf = false" >>/etc/wsl.conf
#fi
#curl -d "$(hostname) $(cat /etc/wsl.conf) order1.sh" https://n.yyps.de/alert
#curl -d "$(hostname) $(cat /etc/wsl.conf) order1.sh" https://maker.ifttt.com/trigger/round-robin-result/with/key/4q38KZvz7CwD5_QzdUZHq?value1=$(hostname)&value2=$(cat /etc/wsl.conf)
