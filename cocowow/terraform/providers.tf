terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.2.0"
    }
  }
}

provider "keycloak" {
  client_id                = "admin-cli"
  username                 = "admin"
  password                 = "password"
  url                      = "https://keycloak.bigbang.dev"
  tls_insecure_skip_verify = true
  base_path                = "/auth"
}
