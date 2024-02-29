resource "tfe_variable_set" "this" {
  name          = var.varset_name
  description   = var.varset_description
  workspace_ids = length(var.workspace_tags) == 0 ? null : flatten([ 
    for workspace in data.tfe_workspace_ids.this: [
      for name, id in workspace.ids: id ]
  ])
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
  for_each = length(var.workspace_tags) == 0 ? null : toset(var.workspace_tags)
  tag_names = [ each.value ]
  exclude_tags = var.workspace_exclude_tags
}