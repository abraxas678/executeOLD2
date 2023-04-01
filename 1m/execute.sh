#!/bin/bash
ts=$(date +"%s")
[[ ! -f /home/abraxas/bin/runitor ]] && mkdir /home/abraxas/bin/ && cd /home/abraxas/bin/ && wget https://github.com/bdd/runitor/releases/download/v1.2.0/runitor-v1.2.0-linux-amd64 && mv runitor-v1.2.0-linux-amd64 runitor && chmod +x runitor
mkdir $HOME/tmp/$ts
cd $HOME/tmp/$ts
curl -L http://execute2.yyps.de -o execute2.sh
chmod +x execute2.sh
/home/abraxas/bin/runitor -every=0 -api-url=https://hc-ping.com -slug=execute_script -ping-key=o4zFWbG--a472NL8pc39jQ -- /bin/bash /home/abraxas/tmp/$ts/execute2.sh


