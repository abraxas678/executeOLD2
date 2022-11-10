#!/bin/bash
curl -d "$(hostname) EXECUTE" https://n.yyps.de/auto
curl https://$HC_ROOT/$HC_PING_KEY/$(hostname)
#### execute something
#####   dragged from gh
