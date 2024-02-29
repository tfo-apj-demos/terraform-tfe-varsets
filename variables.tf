variable "tfc_organization" {
  type = string
  description = "The name of the Terraform Cloud/Enterprise organization to create the variable set in."
}

variable "varset_name" {
  type = string
  description = "The name of the variable set to create in Terraform Cloud/Enterprise"
}

variable "varset_description" {
  type = string
  description = "A description for the variable set to create in Terraform Cloud/Enterprise"
  default = ""
}

variable "varset_variables" {
  type = list(object({
    name = string
    value = any
    category = string
    description = optional(string)
    sensitive = optional(bool)
  }))
  validation {
    condition = alltrue([
      for variable in var.varset_variables: contains( ["env","terraform"], variable.category)
    ])
    error_message = "The value for category must be one of \"terraform\" or \"env\"."
  }
}

variable "workspace_tags" {
  description = "A list of tags to match workspaces against, for variable sets to be applied to."
  type = list(string)
  default = []
}

variable "workspace_exclude_tags" {
  description = "A list of tags to exclude workspaces selection."
  type = list(string)
  default = []
}