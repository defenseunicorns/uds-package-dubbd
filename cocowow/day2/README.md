## Day 2

To manually deploy a new application on day-2 in the Cocowow cluster, the following steps must be completed.

1. Create a new namespace for the app and enable istio injection.

```
kubectl create ns myapp
kubectl label ns myapp "istio-injection=enabled"
```

2. Visit https://keycloak.(MYDOMAIN) and create a client in the cocowow realm for the new app. Copy the clientID and the client secret, which will be used in configuring a new authservice chain. Optionally also create a user to login/access the new app.

3. Create a new authservice config chain for the app. The authservice config resides in the `authconfig` secret in the `authconfig` namespace.
An example authservice config looks like below:

```
{
  "allow_unmatched_requests": true,
  "listen_address": "0.0.0.0",
  "listen_port": "10003",
  "log_level": "trace",
  "default_oidc_config": {
    "authorization_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/auth",
    "token_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/token",
    "jwks_fetcher": {
      "jwks_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/certs",
      "periodic_fetch_interval_sec": 60,
      "skip_verify_peer_cert": "false"
    },
    "client_id": "global_id",
    "client_secret": "global_secret",
    "id_token": {
      "preamble": "Bearer",
      "header": "Authorization"
    },
    "access_token": {
      "header": "JWT"
    },
    "trusted_certificate_authority": "-----BEGIN CERTIFICATE-----...-----END CERTIFICATE-----\n",
    "logout": {
      "path": "/globallogout",
      "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/logout"
    },
    "absolute_session_timeout": "0",
    "idle_session_timeout": "0",
    "scopes": []
  },
  "threads": 8,
  "chains": [
    {
      "name": "alertmanager",
      "match": {
        "header": ":authority",
        "prefix": "alertmanager.bigbang.dev"
      },
      "filters": [
        {
          "oidc_override": {
            "authorization_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/auth",
            "token_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/token",
            "callback_uri": "https://alertmanager.bigbang.dev/login/generic_oauth",
            "client_id": "alertmanager",
            "client_secret": "CHANGE_ME_ALERTMANAGER_SSO_SECRET",
            "cookie_name_prefix": "alertmanager",
            "logout": {
              "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/logout"
            },        
            "scopes": []
          }
        }
      ]
    },
    {
      "name": "local",
      "match": {
        "header": ":local",
        "prefix": "localhost"
      },
      "filters": [
        {
          "oidc_override": {
            "callback_uri": "https://localhost/login",
            "client_id": "local_id",
            "client_secret": "local_secret",
            "cookie_name_prefix": "local",
            "logout": {
              "path": "/local",
              "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/token/logout"
            },        
            "scopes": []
          }
        }
      ]
    },
    {
      "name": "podinfo",
      "match": {
        "header": ":authority",
        "prefix": "podinfo"
      },
      "filters": [
        {
          "oidc_override": {
            "callback_uri": "https://podinfo.bigbang.dev/login/generic_oauth",
            "client_id": "podinfo",
            "client_secret": "CHANGE_ME_MISSION_APP_SECRET",
            "cookie_name_prefix": "podinfo",
            "logout": {
              "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/token/logout"
            },        
            "scopes": []
          }
        }
      ]
    },
    {
      "name": "prometheus",
      "match": {
        "header": ":authority",
        "prefix": "prometheus.bigbang.dev"
      },
      "filters": [
        {
          "oidc_override": {
            "authorization_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/auth",
            "token_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/token",
            "callback_uri": "https://prometheus.bigbang.dev/login/generic_oauth",
            "client_id": "prometheus",
            "client_secret": "CHANGE_ME_PROMETHEUS_SSO_SECRET",
            "cookie_name_prefix": "prometheus",
            "logout": {
              "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/logout"
            },        
            "scopes": []
          }
        }
      ]
    },
    {
      "name": "tempo",
      "match": {
        "header": ":authority",
        "prefix": "tracing.bigbang.dev"
      },
      "filters": [
        {
          "oidc_override": {
            "authorization_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/auth",
            "token_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/token",
            "callback_uri": "https://tracing.bigbang.dev/login",
            "client_id": "tempo",
            "client_secret": "CHANGE_ME_TEMPO_SSO_SECRET",
            "cookie_name_prefix": "tempo",
            "logout": {
              "redirect_uri": "https://keycloak.bigbang.dev/auth/realms/cocowow/protocol/openid-connect/logout"
            },        
            "scopes": []
          }
        }
      ]
    }
  ]
}
```

Add a new chain, representing the new app, to the above config and save it back into the secret.

Restart the authservice deployment.

```
kubectl rollout restart deployment authservice -n authservice
```

