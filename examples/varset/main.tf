module "varset" {
  source = "/Users/go/repos/terraform-tfe-variable-sets"

  tfc_organization = "tfo-apj-demos"
  varset_name = "varset_module_testing"

  varset_variables = [
    {
      name = "var1"
      value = 1
      category = "env"
    },
    {
      name = "var2"
      value = 2
      category = "terraform"
    }
  ]
}