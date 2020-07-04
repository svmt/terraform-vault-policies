provider "vault" {}

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_github_auth_backend" "organization" {
  organization = var.organization
  token_period = var.token_period
}

resource "vault_github_team" "admin" {
  backend = vault_github_auth_backend.organization.id
  team = var.teams["admins"]
  policies = [
    "admins"
  ]
}

resource "vault_github_team" "operations" {
  backend = vault_github_auth_backend.organization.id
  team = var.teams["operations"]
  policies = [
    "operations"
  ]
}

resource "vault_github_team" "developers" {
  backend = vault_github_auth_backend.organization.id
  team = var.teams["developers"]
  policies = [
    "developers"
  ]
}

resource "vault_policy" "admin" {
  name = "admins"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "developer" {
  name = "developers"
  policy = file("policies/developer.hcl")
}

resource "vault_policy" "operations" {
  name = "operations"
  policy = file("policies/operations.hcl")
}

resource "vault_mount" "developers" {
  path = "developers"
  type = "kv-v2"
  description = "KV2 Secrets Engine for Developers."
}

resource "vault_mount" "operations" {
  path = "operations"
  type = "kv-v2"
  description = "KV2 Secrets Engine for Operations."
}
