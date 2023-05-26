# Deploy Podinfo as a Day-2 app

1. Ensure that the Cocowow cluster is up and running. 

```
NAMESPACE            NAME                                                        READY   STATUS    RESTARTS   AGE
authservice          authservice-6c98bdc8d-ld5j4                                 2/2     Running   0          4m22s
flux-system          helm-controller-7b7959cb6d-dmlvj                            1/1     Running   0          28m
flux-system          kustomize-controller-cc7ff74fc-8lj2l                        1/1     Running   0          28m
flux-system          notification-controller-96c454777-8t895                     1/1     Running   0          28m
flux-system          source-controller-68d986b7df-5nxhb                          1/1     Running   0          28m
istio-operator       istio-operator-d969ff68d-kxgr9                              1/1     Running   0          26m
istio-system         istiod-77f46dc695-nlnmh                                     1/1     Running   0          25m
istio-system         passthrough-ingressgateway-5dbb6b6d96-8n87m                 1/1     Running   0          25m
istio-system         public-ingressgateway-5d59c87f48-wzfvw                      1/1     Running   0          25m
keycloak             keycloak-0                                                  2/2     Running   0          23m
keycloak             keycloak-postgresql-0                                       2/2     Running   0          23m
kiali                kiali-56c7566454-wwfsl                                      2/2     Running   0          3m7s
kiali                kiali-kiali-kiali-operator-6dd4fc7658-v6vbv                 2/2     Running   0          17m
kube-system          coredns-787d4945fb-5p72f                                    1/1     Running   0          33m
kube-system          coredns-787d4945fb-vgkh5                                    1/1     Running   0          33m
kube-system          etcd-kind-control-plane                                     1/1     Running   0          33m
kube-system          kindnet-78lfn                                               1/1     Running   0          33m
kube-system          kube-apiserver-kind-control-plane                           1/1     Running   0          33m
kube-system          kube-controller-manager-kind-control-plane                  1/1     Running   0          33m
kube-system          kube-proxy-cspwt                                            1/1     Running   0          33m
kube-system          kube-scheduler-kind-control-plane                           1/1     Running   0          33m
...
kyverno-reporter     kyverno-reporter-7c8f67f84-kzrlc                            2/2     Running   0          23m
kyverno              kyverno-kyverno-85bf4f7d5c-8q2pk                            1/1     Running   0          27m
kyverno              kyverno-kyverno-85bf4f7d5c-8r662                            1/1     Running   0          27m
kyverno              kyverno-kyverno-85bf4f7d5c-9smn4                            1/1     Running   0          27m
local-path-storage   local-path-provisioner-75f5b54ffd-qwrbc                     1/1     Running   0          33m
logging              logging-loki-0                                              2/2     Running   0          23m
metallb-system       controller-577b5bdfcc-2rt6b                                 1/1     Running   0          33m
metallb-system       speaker-q6mb7                                               1/1     Running   0          33m
metrics-server       metrics-server-5d6ff98559-6p4xz                             1/2     Running   0          3m23s
metrics-server       metrics-server-5d6ff98559-v6bt8                             1/2     Running   0          3m24s
monitoring           alertmanager-monitoring-monitoring-kube-alertmanager-0      3/3     Running   0          24m
monitoring           monitoring-monitoring-grafana-8bb745c87-xhwl4               4/4     Running   0          20m
monitoring           monitoring-monitoring-kube-operator-76b6d44b87-qj26c        2/2     Running   0          24m
monitoring           monitoring-monitoring-kube-state-metrics-5ccbf6699c-rng74   2/2     Running   0          24m
monitoring           monitoring-monitoring-prometheus-node-exporter-gwg4j        2/2     Running   0          24m
monitoring           prometheus-monitoring-monitoring-kube-prometheus-0          3/3     Running   0          24m
podinfo              podinfo-77d5b4cf7c-jwrzh                                    2/2     Running   0          3m19s
promtail             promtail-promtail-g5nps                                     2/2     Running   0          21m
tempo                tempo-tempo-0                                               3/3     Running   0          20m
zarf                 agent-hook-5854c7d76d-9cjtq                                 1/1     Running   0          32m
zarf                 agent-hook-5854c7d76d-9rjnh                                 1/1     Running   0          32m
zarf                 zarf-docker-registry-78d74c8cc7-lmw4g                       1/1     Running   0          32m
zarf                 zarf-gitea-0                                                1/1     Running   0          31m
```

2. Ensure that the Keycloak endpoint is accessible via the browser. Login with admin username/password. e.g
https://keycloak.bigbang.dev/auth/admin

3. Create a client for `podinfo`. Make note of the secret. You will use this later while creating the `authservice` chain for `podinfo`.
```
../../kc-api/bin/kcadm.sh config credentials --realm master --server https://keycloak.bigbang.dev/auth --user admin --password password
../../kc-api/bin/kcadm.sh create clients -r cocowow -s clientId=podinfo -s enabled=true -s 'redirectUris=["https://podinfo.bigbang.dev/login/generic_oauth"]'
SECRET=$(../../kc-api/bin/kcadm.sh get clients -r cocowow -q clientId=podinfo --fields=secret | jq -r ".[].secret")
echo $SECRET 
6o4KSeCRi58nWoYOuaImUot2WnFN7Uvc
```
4. Using the client data from the previous step. Create an `authservice` app chain. This data exists in the `authservice` secret in the `authservice` namespace.
```
kubectl get secret authservice -n authservice -o yaml
```
5. Save the `config.json` data from the secret into a file. e.g /tmp/config.json
```
echo ewogICJhbGxvd191bm1hdGNoZWRfcmVxdWVzdHMiOiB0cnVlLAogICJsaXN0ZW5fYWRkcmVzcyI6ICIwLjAuMC4wIiwKICAibGlzdGVuX3BvcnQiOiAiMTAwMDMiLAogICJsb2dfbGV2ZWwiOiAidHJhY2UiLAogICJkZWZhdWx0X29pZGNfY29uZmlnIjogewogICAgInNraXBfdmVyaWZ5X3BlZXJfY2VydCI6IGZhbHNlLAogICAgImF1dGhvcml6YXRpb25fdXJpIjogImh0dHBzOi8va2V5Y2xvYWsuYmlnYmFuZy5kZXYvYXV0aC9yZWFsbXMvY29jb3dvdy9wcm90b2NvbC9vcGVuaWQtY29ubmVjdC9hdXRoIiwKICAgICJ0b2tlbl91cmkiOiAiaHR0cHM6Ly9rZXljbG9hay5iaWdiYW5nLmRldi9hdXRoL3JlYWxtcy9jb2Nvd293L3Byb3RvY29sL29wZW5pZC1jb25uZWN0L3Rva2VuIiwKICAgICJqd2tzX2ZldGNoZXIiOiB7CiAgICAgICJqd2tzX3VyaSI6ICJodHRwczovL2tleWNsb2FrLmJpZ2JhbmcuZGV2L2F1dGgvcmVhbG1zL2NvY293b3cvcHJvdG9jb2wvb3BlbmlkLWNvbm5lY3QvY2VydHMiLAogICAgICAicGVyaW9kaWNfZmV0Y2hfaW50ZXJ2YWxfc2VjIjogNjAsCiAgICAgICJza2lwX3ZlcmlmeV9wZWVyX2NlcnQiOiAiZmFsc2UiCiAgICB9LAogICAgImNsaWVudF9pZCI6ICJnbG9iYWxfaWQiLAogICAgImNsaWVudF9zZWNyZXQiOiAiZ2xvYmFsX3NlY3JldCIsCiAgICAiaWRfdG9rZW4iOiB7CiAgICAgICJwcmVhbWJsZSI6ICJCZWFyZXIiLAogICAgICAiaGVhZGVyIjogIkF1dGhvcml6YXRpb24iCiAgICB9LAogICAgImFjY2Vzc190b2tlbiI6IHsKICAgICAgImhlYWRlciI6ICJKV1QiCiAgICB9LAogICAgInRydXN0ZWRfY2VydGlmaWNhdGVfYXV0aG9yaXR5IjogIi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLVxuTUlJRmF6Q0NBMU9nQXdJQkFnSVJBSUlRejdEU1FPTlpSR1BndTJPQ2l3QXdEUVlKS29aSWh2Y05BUUVMQlFBd1xuVHpFTE1Ba0dBMVVFQmhNQ1ZWTXhLVEFuQmdOVkJBb1RJRWx1ZEdWeWJtVjBJRk5sWTNWeWFYUjVJRkpsYzJWaFxuY21Ob0lFZHliM1Z3TVJVd0V3WURWUVFERXd4SlUxSkhJRkp2YjNRZ1dERXdIaGNOTVRVd05qQTBNVEV3TkRNNFxuV2hjTk16VXdOakEwTVRFd05ETTRXakJQTVFzd0NRWURWUVFHRXdKVlV6RXBNQ2NHQTFVRUNoTWdTVzUwWlhKdVxuWlhRZ1UyVmpkWEpwZEhrZ1VtVnpaV0Z5WTJnZ1IzSnZkWEF4RlRBVEJnTlZCQU1UREVsVFVrY2dVbTl2ZENCWVxuTVRDQ0FpSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnSVBBRENDQWdvQ2dnSUJBSzNvSkhQMEZEZnptNTRyVnlnY1xuaDc3Y3Q5ODRrSXh1UE9aWG9IajNkY0tpL3ZWcWJ2WUFUeWpiM21pR2JFU1R0ckZqL1JRU2E3OGYwdW94bXlGK1xuMFRNOHVrajEzWG5mczdqL0V2RWhta3ZCaW9aeGFVcG1abXlQZmp4d3Y2MHBJZ2J6NU1EbWdLN2lTNCszbVg2VVxuQTUvVFI1ZDhtVWdqVStnNHJrOEtiNE11MFVsWGpJQjB0dG92MERpTmV3TndJUnQxOGpBOCtvK3UzZHBqcStzV1xuVDhLT0VVdCt6d3ZvLzdWM0x2U3llMHJnVEJJbERIQ05BeW1nNFZNazdCUFo3aG0vRUxOS2pEK0pvMkZSM3F5SFxuQjVUMFkzSHNMdUp2VzVpQjRZbGNOSGxzZHU4N2tHSjU1dHVrbWk4bXhkQVE0UTdlMlJDT0Z2dTM5NmozeCtVQ1xuQjVpUE5naVY1K0kzbGcwMmRaNzdEbkt4SFp1OEEvbEpCZGlCM1FXMEt0WkI2YXdCZHBVS0Q5amYxYjBTSHpVdlxuS0JkczBwakJxQWxrZDI1SE43ck9yRmxlYUoxL2N0YUp4UVpCS1Q1WlB0MG05U1RKRWFkYW8weEFIMGFobWJXblxuT2xGdWhqdWVmWEtuRWdWNFdlMCtVWGdWQ3dPUGpkQXZCYkkrZTBvY1MzTUZFdnpHNnVCUUUzeERrM1N6eW5Ublxuamg4QkNOQXcxRnR4TnJRSHVzRXdNRnhJdDRJN21LWjlZSXFpb3ltQ3pMcTlnd1Fib29NRFFhSFdCZkVid3Jid1xucUh5R08wYW9TQ3FJM0hhYWRyOGZhcVU5R1kvck9QTmszc2dyRFFvby8vZmI0aFZDMUNMUUoxM2hlZjRZNTNDSVxuclU3bTJZczZ4dDBuVVc3L3ZHVDFNME5QQWdNQkFBR2pRakJBTUE0R0ExVWREd0VCL3dRRUF3SUJCakFQQmdOVlxuSFJNQkFmOEVCVEFEQVFIL01CMEdBMVVkRGdRV0JCUjV0Rm5tZTdibDVBRnpnQWlJeUJwWTl1bWJiakFOQmdrcVxuaGtpRzl3MEJBUXNGQUFPQ0FnRUFWUjlZcWJ5eXFGRFFETEhZR21rZ0p5a0lyR0YxWElwdStJTGxhUy9WOWxaTFxudWJoekVGblRJWmQrNTB4eCs3TFNZSzA1cUF2cUZ5RldoZkZRRGxucnp1Qlo2YnJKRmUrR25ZK0VnUGJrNlpHUVxuM0JlYllodEY4R2FWMG54dnd1bzc3eC9QeTlhdUovR3BzTWl1L1gxK212b2lCT3YvMlgvcWtTc2lzUmNPai9LS1xuTkZ0WTJQd0J5VlM1dUNiTWlvZ3ppVXd0aER5QzMrNldWd1c2TEx2M3hMZkhUanVDdmpISUluTnprdEhDZ0tRNVxuT1JBekk0Sk1QSitHc2xXWUhiNHBob3dpbTU3aWF6dFhPb0p3VGR3Sng0bkxDZ2ROYk9oZGpzbnZ6cXZIdTdVclxuVGtYV1N0QW16T1Z5eWdocXBaWGpGYUgzcE8zSkxGK2wrLytzS0FJdXZ0ZDd1K054ZTVBVzB3ZGVSbE44TndkQ1xuak5QRWxwelZtYlVxNEpVYWdFaXVURGtIenN4SHBGS1ZLN3E0KzYzU00xTjk1UjFOYmRXaHNjZENiK1pBSnpWY1xub3lpM0I0M25qVE9RNXlPZisxQ2NlV3hHMWJRVnM1WnVmcHNNbGpxNFVpMC8xbHZoK3dqQ2hQNGtxS09KMnF4cVxuNFJncXNhaERZVnZUSDl3N2pYYnlMZWlOZGQ4WE0ydzlVL3Q3eTBGZi85eWkwR0U0NFphNHJGMkxOOWQxMVRQQVxubVJHdW5VSEJjbldFdmdKQlFsOW5KRWlVMFpzbnZnYy91YmhQZ1hSUjRYcTM3WjBqNHI3ZzFTZ0VFend4QTU3ZFxuZW15UHhnY1l4bi9lUjQ0L0tKNEVCcytsVkRSM3ZleUptK2tYUTk5YjIxLytqaDVYb3MxQW5YNWlJdHJlR0NjPVxuLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLVxuIiwKICAgICJsb2dvdXQiOiB7CiAgICAgICJwYXRoIjogIi9nbG9iYWxsb2dvdXQiLAogICAgICAicmVkaXJlY3RfdXJpIjogImh0dHBzOi8va2V5Y2xvYWsuYmlnYmFuZy5kZXYvYXV0aC9yZWFsbXMvY29jb3dvdy9wcm90b2NvbC9vcGVuaWQtY29ubmVjdC9sb2dvdXQiCiAgICB9LAogICAgImFic29sdXRlX3Nlc3Npb25fdGltZW91dCI6ICIwIiwKICAgICJpZGxlX3Nlc3Npb25fdGltZW91dCI6ICIwIiwKICAgICJzY29wZXMiOiBbXQogIH0sCiAgInRocmVhZHMiOiA4LAogICJjaGFpbnMiOiBbCiAgICB7CiAgICAgICJuYW1lIjogImFsZXJ0bWFuYWdlciIsCiAgICAgICJtYXRjaCI6IHsKICAgICAgICAiaGVhZGVyIjogIjphdXRob3JpdHkiLAogICAgICAgICJwcmVmaXgiOiAiYWxlcnRtYW5hZ2VyLmJpZ2JhbmcuZGV2IgogICAgICB9LAogICAgICAiZmlsdGVycyI6IFsKICAgICAgICB7CiAgICAgICAgICAib2lkY19vdmVycmlkZSI6IHsKICAgICAgICAgICAgImF1dGhvcml6YXRpb25fdXJpIjogImh0dHBzOi8va2V5Y2xvYWsuYmlnYmFuZy5kZXYvYXV0aC9yZWFsbXMvY29jb3dvdy9wcm90b2NvbC9vcGVuaWQtY29ubmVjdC9hdXRoIiwKICAgICAgICAgICAgInRva2VuX3VyaSI6ICJodHRwczovL2tleWNsb2FrLmJpZ2JhbmcuZGV2L2F1dGgvcmVhbG1zL2NvY293b3cvcHJvdG9jb2wvb3BlbmlkLWNvbm5lY3QvdG9rZW4iLAogICAgICAgICAgICAiY2FsbGJhY2tfdXJpIjogImh0dHBzOi8vYWxlcnRtYW5hZ2VyLmJpZ2JhbmcuZGV2L2xvZ2luL2dlbmVyaWNfb2F1dGgiLAogICAgICAgICAgICAiY2xpZW50X2lkIjogImFsZXJ0bWFuYWdlciIsCiAgICAgICAgICAgICJjbGllbnRfc2VjcmV0IjogIkNIQU5HRV9NRV9BTEVSVE1BTkFHRVJfU1NPX1NFQ1JFVCIsCiAgICAgICAgICAgICJjb29raWVfbmFtZV9wcmVmaXgiOiAiYWxlcnRtYW5hZ2VyIiwKICAgICAgICAgICAgImxvZ291dCI6IHsKICAgICAgICAgICAgICAicmVkaXJlY3RfdXJpIjogImh0dHBzOi8va2V5Y2xvYWsuYmlnYmFuZy5kZXYvYXV0aC9yZWFsbXMvY29jb3dvdy9wcm90b2NvbC9vcGVuaWQtY29ubmVjdC9sb2dvdXQiCiAgICAgICAgICAgIH0sICAgICAgICAKICAgICAgICAgICAgInNjb3BlcyI6IFtdCiAgICAgICAgICB9CiAgICAgICAgfQogICAgICBdCiAgICB9LAogICAgewogICAgICAibmFtZSI6ICJsb2NhbCIsCiAgICAgICJtYXRjaCI6IHsKICAgICAgICAiaGVhZGVyIjogIjpsb2NhbCIsCiAgICAgICAgInByZWZpeCI6ICJsb2NhbGhvc3QiCiAgICAgIH0sCiAgICAgICJmaWx0ZXJzIjogWwogICAgICAgIHsKICAgICAgICAgICJvaWRjX292ZXJyaWRlIjogewogICAgICAgICAgICAiY2FsbGJhY2tfdXJpIjogImh0dHBzOi8vbG9jYWxob3N0L2xvZ2luIiwKICAgICAgICAgICAgImNsaWVudF9pZCI6ICJsb2NhbF9pZCIsCiAgICAgICAgICAgICJjbGllbnRfc2VjcmV0IjogImxvY2FsX3NlY3JldCIsCiAgICAgICAgICAgICJjb29raWVfbmFtZV9wcmVmaXgiOiAibG9jYWwiLAogICAgICAgICAgICAibG9nb3V0IjogewogICAgICAgICAgICAgICJwYXRoIjogIi9sb2NhbCIsCiAgICAgICAgICAgICAgInJlZGlyZWN0X3VyaSI6ICJodHRwczovL2tleWNsb2FrLmJpZ2JhbmcuZGV2L2F1dGgvcmVhbG1zL2NvY293b3cvcHJvdG9jb2wvb3BlbmlkLWNvbm5lY3QvdG9rZW4vbG9nb3V0IgogICAgICAgICAgICB9LCAgICAgICAgCiAgICAgICAgICAgICJzY29wZXMiOiBbXQogICAgICAgICAgfQogICAgICAgIH0KICAgICAgXQogICAgfSwKICAgIHsKICAgICAgIm5hbWUiOiAicHJvbWV0aGV1cyIsCiAgICAgICJtYXRjaCI6IHsKICAgICAgICAiaGVhZGVyIjogIjphdXRob3JpdHkiLAogICAgICAgICJwcmVmaXgiOiAicHJvbWV0aGV1cy5iaWdiYW5nLmRldiIKICAgICAgfSwKICAgICAgImZpbHRlcnMiOiBbCiAgICAgICAgewogICAgICAgICAgIm9pZGNfb3ZlcnJpZGUiOiB7CiAgICAgICAgICAgICJhdXRob3JpemF0aW9uX3VyaSI6ICJodHRwczovL2tleWNsb2FrLmJpZ2JhbmcuZGV2L2F1dGgvcmVhbG1zL2NvY293b3cvcHJvdG9jb2wvb3BlbmlkLWNvbm5lY3QvYXV0aCIsCiAgICAgICAgICAgICJ0b2tlbl91cmkiOiAiaHR0cHM6Ly9rZXljbG9hay5iaWdiYW5nLmRldi9hdXRoL3JlYWxtcy9jb2Nvd293L3Byb3RvY29sL29wZW5pZC1jb25uZWN0L3Rva2VuIiwKICAgICAgICAgICAgImNhbGxiYWNrX3VyaSI6ICJodHRwczovL3Byb21ldGhldXMuYmlnYmFuZy5kZXYvbG9naW4vZ2VuZXJpY19vYXV0aCIsCiAgICAgICAgICAgICJjbGllbnRfaWQiOiAicHJvbWV0aGV1cyIsCiAgICAgICAgICAgICJjbGllbnRfc2VjcmV0IjogIkNIQU5HRV9NRV9QUk9NRVRIRVVTX1NTT19TRUNSRVQiLAogICAgICAgICAgICAiY29va2llX25hbWVfcHJlZml4IjogInByb21ldGhldXMiLAogICAgICAgICAgICAibG9nb3V0IjogewogICAgICAgICAgICAgICJyZWRpcmVjdF91cmkiOiAiaHR0cHM6Ly9rZXljbG9hay5iaWdiYW5nLmRldi9hdXRoL3JlYWxtcy9jb2Nvd293L3Byb3RvY29sL29wZW5pZC1jb25uZWN0L2xvZ291dCIKICAgICAgICAgICAgfSwgICAgICAgIAogICAgICAgICAgICAic2NvcGVzIjogW10KICAgICAgICAgIH0KICAgICAgICB9CiAgICAgIF0KICAgIH0sCiAgICB7CiAgICAgICJuYW1lIjogInRlbXBvIiwKICAgICAgIm1hdGNoIjogewogICAgICAgICJoZWFkZXIiOiAiOmF1dGhvcml0eSIsCiAgICAgICAgInByZWZpeCI6ICJ0cmFjaW5nLmJpZ2JhbmcuZGV2IgogICAgICB9LAogICAgICAiZmlsdGVycyI6IFsKICAgICAgICB7CiAgICAgICAgICAib2lkY19vdmVycmlkZSI6IHsKICAgICAgICAgICAgImF1dGhvcml6YXRpb25fdXJpIjogImh0dHBzOi8va2V5Y2xvYWsuYmlnYmFuZy5kZXYvYXV0aC9yZWFsbXMvY29jb3dvdy9wcm90b2NvbC9vcGVuaWQtY29ubmVjdC9hdXRoIiwKICAgICAgICAgICAgInRva2VuX3VyaSI6ICJodHRwczovL2tleWNsb2FrLmJpZ2JhbmcuZGV2L2F1dGgvcmVhbG1zL2NvY293b3cvcHJvdG9jb2wvb3BlbmlkLWNvbm5lY3QvdG9rZW4iLAogICAgICAgICAgICAiY2FsbGJhY2tfdXJpIjogImh0dHBzOi8vdHJhY2luZy5iaWdiYW5nLmRldi9sb2dpbiIsCiAgICAgICAgICAgICJjbGllbnRfaWQiOiAidGVtcG8iLAogICAgICAgICAgICAiY2xpZW50X3NlY3JldCI6ICIybHNiUDV4bjZqUDRUcEdnRnlUOTh6TnVhbUhTOG84MiIsCiAgICAgICAgICAgICJjb29raWVfbmFtZV9wcmVmaXgiOiAidGVtcG8iLAogICAgICAgICAgICAibG9nb3V0IjogewogICAgICAgICAgICAgICJyZWRpcmVjdF91cmkiOiAiaHR0cHM6Ly9rZXljbG9hay5iaWdiYW5nLmRldi9hdXRoL3JlYWxtcy9jb2Nvd293L3Byb3RvY29sL29wZW5pZC1jb25uZWN0L2xvZ291dCIKICAgICAgICAgICAgfSwgICAgICAgIAogICAgICAgICAgICAic2NvcGVzIjogW10KICAgICAgICAgIH0KICAgICAgICB9CiAgICAgIF0KICAgIH0KICBdCn0K|base64 -d>>/tmp/config.json
```

6. Edit the `/tmp/config.json` and add a new chain.

```
...
   {
      "name": "podinfo",
      "match": {
        "header": ":authority",
        "prefix": "podinfo.bigbang.dev"
      },
      "filters": [
        {
          "oidc_override": {
            "authorization_uri": "https://keycloak.bigbang.dev/auth/realms/baby-yoda/protocol/openid-connect/auth",
            "token_uri": "https://keycloak.bigbang.dev/auth/realms/baby-yoda/protocol/openid-connect/token",
            "callback_uri": "https://podinfo.bigbang.dev/login/generic_oauth",
            "client_id": "pbme_adcbff02-a1ab-4fba-9c83-fe44a2bba117_podinfo",
            "client_secret": "L48yyzbwyD8YjaycT1FvxGPG0rhyKBxK",  # SECRET from step 2
            "cookie_name_prefix": "podinfo",
            "logout": {
              "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/baby-yoda/protocol/openid-connect/logout"
            },     
            "scopes": []
          }
        }
      ]
    },
...
```

7. Convert the json file back to base64. Copy the base64 blob and edit the `authservice` secret.
```
cat /tmp/config.json | base64 | tr -d '\n'
```

8. Edit the `authservice` secret and update the `config.json` data. After a successful update, restart the `authservice` pod.
```
kubectl edit secret authservice -n authservice
kubectl rollout restart deployment -n authservice
```

9. Visit https://podinfo.bigbang.dev and notice that you will get redirected to https://keycloak.bigbang.dev. Login as user `demo` with `supersecretpassword`.

10. Pepr will automate this some day. An interim program to automagically create a client and update the `authservice` chain will appear in this directory.
