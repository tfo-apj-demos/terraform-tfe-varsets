terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0"
    }
    hcp = {
      source = "hashicorp/hcp"
      version = "~> 0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "~> 3"
    }
  }
}