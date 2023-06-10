#!/bin/bash

# echo "tests go here!"

namespace=$1
svc_name=$2
svc_port=$3
local_port=62202


kubectl port-forward -n $namespace service/$svc_name $local_port:$svc_port > /dev/null 2>&1 &
PID_PF=$!
trap '{
    kill $PID_PF
}' EXIT

# The port-forward takes longer to fully setup when being backgrounded.  
# The sleep is there to make sure it is available for the curl that executes.
sleep 1

HTTP_RESPONSE_CODE=$(curl -s -o /dev/null -I -w "%{http_code}" http://localhost:$local_port)

if [[ $HTTP_RESPONSE_CODE == "301" || $HTTP_RESPONSE_CODE == "200" ]]; then 
    echo "Neuvector is up and reachable."
else
    echo "Neuvector is not reachable"
fi
