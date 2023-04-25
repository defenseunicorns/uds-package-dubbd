resource "keycloak_realm" "realm" {
  realm   = "cocowow"
  enabled = true
}

resource "keycloak_openid_client" "podinfo" {
  realm_id  = keycloak_realm.realm.id
  client_id = "podinfo"

  name    = "podinfo"
  enabled = true

  access_type = "CONFIDENTIAL"
  valid_redirect_uris = [
    "https://podinfo.bigbang.dev/login/generic_oauth"
  ]

  login_theme = "keycloak"
}
