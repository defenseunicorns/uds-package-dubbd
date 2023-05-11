#!/bin/sh

#Kiali SSO:
SECRET=$(./kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=kiali --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(echo $SECRET|base64)
kubectl patch secret -n kiali kiali --type=merge -p '{"data": {"oidc-secret": "'"${ENCODED_VALUE}"'"}}' || true
kubectl rollout restart deployment -n kiali || true

#Tempo SSO:
SECRET=$(./kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=tempo --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_TEMPO_SSO_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}' || true
kubectl rollout restart statefulset -n tempo || true

#Grafana SSO:
SECRET=$(./kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=grafana --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(echo $SECRET|base64)
kubectl patch secret -n monitoring grafana-sso --type=merge -p '{"data": {"client_secret": "'"${ENCODED_VALUE}"'"}}' || true
kubectl rollout restart deployment monitoring-monitoring-grafana -n monitoring || true

#Prometheus SSO:
SECRET=$(./kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=prometheus --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_PROMETHEUS_SSO_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}' || true

#Alertmanager SSO:
SECRET=$(./kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=alertmanager --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_ALERTMANAGER_SSO_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}' || true
# This will restart both Prometheus and Alertmanager statefulsets
kubectl rollout restart statefulset -n monitoring || true

#Neuvector SSO:
SECRET=$(./kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=neuvector --fields=secret | jq -r ".[].secret")
ENCODED_VALUE=$(kubectl get secret authservice -n authservice -o jsonpath='{.data.config\.json}'|base64 -d|sed "s/CHANGE_ME_NEUVECTOR_SSO_SECRET/$SECRET/g"|base64|tr -d '\n' | sed 's/ //g')
kubectl patch secret -n authservice authservice --type=merge -p '{"data": {"config.json": "'"${ENCODED_VALUE}"'"}}' || true
kubectl rollout restart deployment -n neuvector || true
