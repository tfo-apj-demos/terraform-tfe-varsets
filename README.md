# Terraform TFE Variable Sets

[![License](https://img.shields.io/badge/license-APACHE-blue.svg)](LICENSE)

## Description

This module will generate variable sets for TFE/TFC

## Table of Contents

- [Usage](#usage)

## Usage

Examples folder demonstrates TFE variables,values sourced from HashiCorp Vault Secrets, and secrets sourced from HashiCorp Vault.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.51.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The name of the Terraform Cloud/Enterprise organization to create the variable set in. | `string` | n/a | yes |
| <a name="input_varset_description"></a> [varset\_description](#input\_varset\_description) | A description for the variable set to create in Terraform Cloud/Enterprise | `string` | `""` | no |
| <a name="input_varset_name"></a> [varset\_name](#input\_varset\_name) | The name of the variable set to create in Terraform Cloud/Enterprise | `string` | n/a | yes |
| <a name="input_varset_variables"></a> [varset\_variables](#input\_varset\_variables) | n/a | <pre>list(object({<br>    name = string<br>    value = any<br>    category = string<br>    description = optional(string)<br>    sensitive = optional(bool)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->