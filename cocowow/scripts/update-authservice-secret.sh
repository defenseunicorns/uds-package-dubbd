#!/bin/bash -x

# encode the updated json back to base64
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_MISSION_APP_SECRET/###ZARF_VAR_MISSION_APP_SECRET###/g" | sed "s/CHANGE_ME_MISSION_APP_ID/###ZARF_VAR_MISSION_APP_ID###/g"|base64|tr -d '\n' | sed 's/ //g')

echo $ENCODED_VALUE|base64 -d

# update the kubernetes secret with the new value
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}'

