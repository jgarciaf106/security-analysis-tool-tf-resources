variable "prefix" {
  type = string
}
variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}
variable "create_resource_group" {
  type = bool
}

variable "spoke_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group to create"
}

variable "managed_resource_group_name" {
  type        = string
  description = "(Optional) The name of the resource group where Azure should place the managed Databricks resources"
  default     = ""
}
variable "environment_name" {
  type        = string
  description = "(Required) The name of the project environment associated with the infrastructure to be managed by Terraform"
}

variable "spoke_vnet_address_space" {
  type        = string
  description = "(Required) The address space for the spoke Virtual Network"
}

variable "shared_resource_group_name" {
  type        = string
  description = "Name of the shared resource group"
}

variable "metastore_owner" {
  default = "sat_deploy_testing_group"
  type = string
}

variable "admin_user" {
  type        = string
  description = "The admin user for the Databricks workspace"
}

variable "account_id" {
  type        = string
  description = "Databricks Account ID"
}
variable "dbfsname" {
  type        = string
}