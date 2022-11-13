#!/bin/bash

$HOME/bin/sudo.sh rclone lsd ~/tmp
/usr/bin/task sync

### am here NTFY auto
curl -d "$(hostname) $(date) EXECUTE >>>1h<<<" https://n.yyps.de/auto

### am here HC.IO
curl -d ">>>1h<<<" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)/log

if [[ $(hostname) = *"ionos" ]]; then
  $HOME/bin/bookmarks.sh
fi

if [[ $(hostname) = *"aws"* ]]; then
  echo " "
fi
