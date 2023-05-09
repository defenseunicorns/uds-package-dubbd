#!/bin/sh

#Kiali SSO:
SECRET=$(../kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=kiali --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(echo $SECRET|base64)
kubectl patch secret -n kiali kiali --type=merge -p '{"data": {"oidc-secret": "'"${ENCODED_VALUE}"'"}}'
kubectl rollout restart deployment kiali -n kiali

#Tempo SSO:
SECRET=$(../kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=tempo --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_TEMPO_SSO_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}'
kubectl rollout restart statefulset tempo-tempo -n tempo

#Grafana SSO:
SECRET=$(../kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=grafana --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(echo $SECRET|base64)
kubectl patch secret -n monitoring grafana-sso --type=merge -p '{"data": {"client_secret": "'"${ENCODED_VALUE}"'"}}'
kubectl rollout restart deployment monitoring-monitoring-grafana -n monitoring

#Neuvector SSO:
SECRET=$(../kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=neuvector --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_NEUVECTOR_SSO_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}'
kubectl rollout restart deployment neuvector -n neuvector
