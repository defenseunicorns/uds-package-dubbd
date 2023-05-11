#!/bin/bash -x

kcadm.sh config credentials --realm master --server https://keycloak.bigbang.dev/auth --user admin --password password
kcadm.sh create clients -r cocowow -s clientId=podinfo -s enabled=true -s 'redirectUris=["https://podinfo.bigbang.dev/login/generic_oauth"]'
SECRET=$(kcadm.sh get clients -r cocowow -q clientId=podinfo --fields=secret | jq -r ".[].secret")

# encode the updated json back to base64
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_MISSION_APP_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')

# update the kubernetes secret with the new value
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}'

