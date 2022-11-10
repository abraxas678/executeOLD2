#!/bin/bash
curl -d "$(hostname) $(date) EXECUTE" https://n.yyps.de/auto
curl https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
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

curl -d "$(echo tsync -api-url=\"$HC_ROOT_URL/ping\" -uuid=\"$MY_UUID\" -ping-key=\"kDHCdjmjDpr72AOHTdMKBw\" -quiet=\"false\" -silent=\"false\" -no-start-ping=\"false\" -no-output-in-ping=\"false\" /usr/bin/task sync)" https://n.yyps.de/auto
