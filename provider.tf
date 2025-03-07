provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://vault-internal.santoshpawar.site:8200"
  token   = var.vault_token
}