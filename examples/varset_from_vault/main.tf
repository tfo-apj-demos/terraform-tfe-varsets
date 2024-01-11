module "varset" {
  source = "/Users/go/repos/terraform-tfe-variable-sets"

  tfc_organization = "tfo-apj-demos"
  varset_name = "varset_module_testing_from_vault"

  varset_variables = [
    {
      name = "VSPHERE_USER"
      value = data.vault_generic_secret.this.data.username
      category = "env"
    },
    {
      name = "VSPHERE_PASSWORD"
      value = data.vault_generic_secret.this.data.password
      category = "env"
      sensitive = true
    },
    {
      name = "VSPHERE_SERVER"
      value = "vcenter.hashicorp.local"
      category = "env"
    }
  ]
}

data "vault_generic_secret" "this" {
  path = "ldap/creds/vsphere_access"
}