resource "tfe_variable_set" "this" {
  name          = var.varset_name
  description   = var.varset_description
}

resource "tfe_variable" "this" {
  for_each = { for variable in var.varset_variables: variable.name => variable }
  key             = each.value.name
  value           = each.value.value
  category        = each.value.category
  description     = each.value.description
  variable_set_id = tfe_variable_set.this.id
  sensitive = each.value.sensitive
}