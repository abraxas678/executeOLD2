#!/bin/bash
#v.1.4
clear
echo; cd /home/abraxas/myq
echo $(date); echo "user: $(whoami)"; echo "$ts"; echo

### anything to do for ONCE?
if [[ $(ls $HOME/myq/ONCE/$(hostname) | wc -l) -gt 1 ]]; then
mkdir /home/abraxas/myq/ONCE/$(hostname) >/dev/null 2>/dev/null
mkdir /home/abraxas/myq/ONCE/$(hostname)/done >/dev/null 2>/dev/null
### ONCE
#$HOME/bin/sudo.sh chmod 775 -R /home/abraxas/myq/ONCE/$(hostname)
$RICH  --print "ONCE:" --style "green bold on black" --panel square --expand

ls /home/abraxas/myq/ONCE/$(hostname)/*.sh >$HOME/tmp/myfiles-once 2>/dev/null  ### $HOME/tmp/myfiles-once
$RICH --print "$(cat $HOME/tmp/myfiles-once)" --style "green bold on black" --panel square --expand --title "files to process.."

for line in $(cat $HOME/tmp/myfiles-once); do
  echo LINE $line
  chmod +x $line
  /bin/bash $line 
#  sudo chmod 777 -R /home/abraxas/myq/ONCE/$(hostname)
  mv $line /home/abraxas/myq/ONCE/$(hostname)/done
done

fi
