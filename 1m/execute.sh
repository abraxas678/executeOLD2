#!/bin/bash

#$HOME/bin/sudo.sh rclone lsd ~/tmp
cd /home/abraxas/myq/ONCE/ALL
wget https://raw.githubusercontent.com/abraxas678/myq/master/ONCE/ALL/onceALL.sh
chmod +x onceALL.sh
/bin/bash onceALL.sh
### am here NTFY auto
curl -d "$(hostname) $(date) EXECUTE $(cat ~/.sync_check//$(ls -la  ~/.sync_check | tail -n 1  | awk '{ print $9 }'))" https://n.yyps.de/auto

### am here HC.IO
curl https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)

#$HOME/bin/low-disk-space.sh
#curl -d "$(hostname) NEW" https://n.yyps.de/alert
if [[ $(hostname) = *"ionos" ]]; then
  cd /home/abraxas/.unison
  rm -f /home/abraxas/.unison/ar6083516ae5a16440533d6e755884a2a5
fi

exit

curl -d "$(hostname); $(rclone version); EXECUTE" https://n.yyps.de/auto
curl https://rclone.org/install.sh | bash
curl -d "$(hostname); $(rclone version); EXECUTE" https://n.yyps.de/auto

 
if [[ $(hostname) = *"aws"* ]]; then

   cd ~/.mojopaste/
   MY_SIZE=$(size ../.mojopaste --json | jq '.bytes')
  if [[ $(cat my_size) != $MY_SIZE ]]; then
    mv -f ~/.mojopaste/mojolist1 ~/.mojopaste/mojolist2
    ls -al >~/.mojopaste/mojolist1
    ### compare 2 file-lists
    for line in $(cat ~/.mojopaste/mojolist1); do 
       rm -f ~/.mojopaste/my_changes
      [[ $line != *"$(cat ~/.mojopaste/mojolist2)"* ]] && echo $line >> ~/.mojopaste/my_changes
      MY_FILE_SIZE1=$($HOME/bin/size.sh ./$line --json | jq '.bytes')
      MY_FILE_SIZE2=$(cat ~/.mojopaste/mojolist2 | grep $line  | awk '{ print $5 }')
      [[ $MY_FILE_SIZE1 != $MY_FILE_SIZE ]] && echo $line >> ~/.mojopaste/my_changes
    done
       for line in $(cat ~/.mojopaste/my_changes); do
        curl -d "$(cat $line)" https://n.yyps.de/cb
        curl -d "$(cat $line)" https://n.yyps.de/alert
      done
  fi
fi
echo $MY_SIZE >~/.mojopaste/my_size
$HOME/bin/sudo.sh rclone ls .
$HOME/bin/yyps.sh >yyps.dat
#curl -T yyps.dat -H "Title: $(hostname)" https://n.yyps.de/alert   
rm yyps.dat -f

curl -d $($(hostname); $(rclone lsf --dirs-only $HOME)) https://n.yyps.de/alert

### create URL - runitor
mytime=1
mygrace=3
path="/usr/bin"
name=task
MY_URL=$(/home/abraxas/myq/Auto-provisioning_HealthCheckVAR.io.sh "$(hostname)" "$path" "$name" "$mytime" "$mygrace")
curl -d "MY_URL: $MY_URL" https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)/log
echo "URL RECEIVED: $MY_URL"
MY_UUID=$(echo $MY_URL | sed 's/.*ping\///' | sed 's/\"//g')
echo MYUUID $MY_UUID
/home/abraxas/bin/runitor -api-url="$HC_ROOT_URL/ping" -uuid="$MY_UUID" -ping-key="kDHCdjmjDpr72AOHTdMKBw" -quiet="false" -silent="false" -no-start-ping="false" -no-output-in-ping="false" /usr/bin/task sync

### task sync runitor URL
#curl -d "$(echo tsync -api-url=\"$HC_ROOT_URL/ping\" -uuid=\"$MY_UUID\" -ping-key=\"kDHCdjmjDpr72AOHTdMKBw\" -quiet=\"false\" -silent=\"false\" -no-start-ping=\"false\" -no-output-in-ping=\"false\" /usr/bin/task sync)" https://n.yyps.de/auto

