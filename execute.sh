#!/bin/bash
curl -d "$(hostname) EXECUTE DONE" https://n.yyps.de/auto
curl https://hc-ping.com/o4zFWbG--a472NL8pc39jQ/$(hostname)
mytime=1
mygrace=3
path="/usr/bin"
name=task
# /home/abraxas/myq/Auto-provisioning_HealthCheckVAR.io.sh "$(hostname)" "$path" "$name" "$mytime" "$mygrace")
# /home/abraxas/bin/runitor -ping-key="$HC_PING_KEY" -uuid="b79c45fe-8677-4e5f-8c56-30565a2414bb" -api-url="https://hc.dmw.zone/ping" 
#  /home/abraxas/bin/runitor -api-url="$HC_ROOT_URL/ping" -uuid="$MY_UUID" -ping-key="kDHCdjmjDpr72AOHTdMKBw" -quiet="false" -silent="false" -no-start-ping="false" -no-output-in-ping="false"
