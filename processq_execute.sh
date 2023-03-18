#!/bin/bash

API_KEY=yKUu1sWOMZNtY3FcAhy5V8Jq9OkGhqCF

# Check's parameters. This example uses system's hostname for check's name.
PAYLOAD='{"name": "execute_'`hostname`'", "timeout": 60, "grace": 300, "unique": ["name"], "tags": "execute_'`hostname`'"}'

# Create the check if it does not exist.
# Grab the ping_url from JSON response using the jq utility:
URL=`curl -s https://healthchecks.io/api/v1/checks/  -H "X-Api-Key: $API_KEY" -d "$PAYLOAD"  | jq -r .ping_url`

# Finally, send a ping:
curl -m 10 --retry 5 $URL
