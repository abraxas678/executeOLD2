#!/bin/bash
echo "ORDER1: $(hostname)"
curl -s -d "$(hostname)" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/order1/log

source $HOME/bin/color.dat
chmod go-w /home/$USER
chmod 700 /home/$USER/.ssh
chmod 644 /home/$USER/.ssh/authorized_keys
chown $USER: /home/$USER/.ssh/authorized_keys
chown $USER: /home/$USER/.ssh
/bin/bash $HOME/bin/sudo.sh service ssh restart
chmod 644 /home/$USER/.ssh/*.pub
chmod 600 /home/$USER/.ssh/id*

/bin/bash $HOME/bin/update_hosts.sh

/bin/bash /home/abraxas/bin/clean-rclone-conf.sh

if [[ ! -f /home/abraxas/tmp/unison_update.dat ]]; then
  cd /home/abraxas/tmp
  curl -Ls https://raw.githubusercontent.com/abraxas678/startp/master/setup_unison.sh >/home/abraxas/tmp/setup_unison.sh
  chmod +x *.sh
  /bin/bash /home/abraxas/tmp/setup_unison.sh
  curl -d "unison update $(hostname)" https://n.yyps.de/alert
fi

echo $(hostname)$(date) >> /home/abraxas/tmp/unison_update.dat

$HOME/bin/last_screenshot.sh >$HOME/bin/last_screenshot.last

#❯ cat /etc/resolv.conf
# This file was automatically generated by WSL. To stop automatic generation of this file, add the following entry to /etc/wsl.conf:
# [network]
# generateResolvConf = false
#nameserver 172.31.96.1
#[[ ! -d $HOME/.local/share/dotfiles ]] && rm -rf $HOME/.local/share/dotfiles

curl -s -d "order1.sh" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)

#source $HOME/.zsh.env
#[[ $( rclone ls snas:downloads/MOUNT_CHECK | wc -l ) = "1" ]] && MY_SNAS="$BGREEN [snas]" | MY_SNAS="$BRED [snas]"
#[[ $( rclone ls snaslocal:downloads/MOUNT_CHECK | wc -l ) = "1" ]] && MY_SNASLOCAL="$BGREEN´[snaslocal]" |  MY_SNASLOCAL="$BRED [snaslocal]"
#[[ $( rclone ls snas2:downloads/MOUNT_CHECK | wc -l ) = "1" ]] && MY_SNAS2="$BGREEN [snaslocal]" |  MY_SNAS2="$BRED [snaslocal]"
#echo $MY_SNAS >$HOME/tmp/my_snas
#echo $MY_SNAS2 >$HOME/tmp/my_snas2
#echo $MY_SNASLOCAL >$HOME/tmp/my_snaslocal
#if [[ $(cat /etc/wsl.conf) != *"generateResolvConf = false"* ]]; then
#  $HOME/bin/sudo.sh echo "[network]" >>/etc/wsl.conf
#  $HOME/bin/sudo.sh echo "generateResolvConf = false" >>/etc/wsl.conf
#fi
#curl -d "$(hostname) $(cat /etc/wsl.conf) order1.sh" https://n.yyps.de/alert
#curl -d "$(hostname) $(cat /etc/wsl.conf) order1.sh" https://maker.ifttt.com/trigger/round-robin-result/with/key/4q38KZvz7CwD5_QzdUZHq?value1=$(hostname)&value2=$(cat /etc/wsl.conf)
