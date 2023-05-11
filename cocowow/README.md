# CoCoWoW

This packages builds on DUBBD with the addition of Keycloak and Authservice. A mock mission app is found in the `podinfo`
directory with instructions to deploy it on day 2.

## Build

```
zarf package create --confirm
```

## Deploy
```
zarf package deploy ./zarf-package* --confirm
```

## Day 2
See the `podinfo` directory for further instructions to deploy and SSO-enable an app on Day 2.
