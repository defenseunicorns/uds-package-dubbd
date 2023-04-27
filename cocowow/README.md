# CoCoWoW

This packages builds on DUBBD with the addition of Keycloak, Authservice and a mock mission app (Podinfo).
After keycloak is deployed, a Keycloak client, currently the `kc-adm.sh` script, is used to configure a `cocowow` realm and
a client for the mock app is created in this realm. The client ID and its secret from Keycloak are then utilized to configure
the `authservice` secret in the `authservice` namespace.

## Build

```
zarf package create --confirm
```

## Deploy
```
zarf package deploy ./zarf-package* --confirm
```

## Launch App

Visit https://podinfo.bigbang.dev to view the SSO-enabled Podinfo. The username is `demo` and the password is `supersecretpassword`
