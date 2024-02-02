
variables {
  tfc_organization = "tfe-apj-demos"
  varset_name      = "test_varset"
  varset_variables = [
    {
      name      = "var1"
      value     = 1
      category  = "env"
      sensitive = true
    }
  ]
}

run "valid_varset_name" {
  command = plan

  assert {
    condition     = tfe_variable_set.this.name == var.varset_name
    error_message = "Variable set name does not match"
  }
}

run "valid_varset_variable" {
  command = plan

  assert {
    condition     = tfe_variable.this["var1"].key == "var1"
    error_message = "Variable name does not match"
  }
  assert {
    condition     = tfe_variable.this["var1"].category == "env"
    error_message = "Variable category does not match"
  }
  assert {
    condition     = tfe_variable.this["var1"].sensitive == true
    error_message = "Variable is not sensitive"
  }
}

run "valid_sensitive_varset_variable" {
  command = plan


}
