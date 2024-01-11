module "varset" {
  source = "github.com/tfo-apj-demos/terraform-tfe-varsets"

  tfc_organization = "tfo-apj-demos"
  varset_name = "varset_module_testing_from_hcp_vault_secrets"

  varset_variables = [
    {
      name = data.hcp_vault_secrets_secret.this.secret_name
      value = data.hcp_vault_secrets_secret.this.secret_value
      category = "terraform"
    }
  ]
}

data "hcp_vault_secrets_secret" "this" {
  app_name = "packer"
  secret_name = "linux_password"
}