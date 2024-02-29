resource "tfe_variable_set" "this" {
  name          = var.varset_name
  description   = var.varset_description
  workspace_ids = length(var.workspace_tags) == 0 ? null : [ for name, id in data.tfe_workspace_ids.this[0].ids: id ]
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

data "tfe_workspace_ids" "this" {
  count = length(var.workspace_tags) == 0 ? 0 : 1
  tag_names = var.workspace_tags
  exclude_tags = var.workspace_exclude_tags
}