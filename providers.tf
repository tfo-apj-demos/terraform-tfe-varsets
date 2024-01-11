terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0"
    }
  }
}

provider "tfe" {
  organization = var.tfc_organization
}