variable "prefix" {
  type = string
}
variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "client_id" {
  type        = string
  description = "Client Id for the service principal"
}

variable "client_secret" {
  type        = string
  description = "Client secret for the service principal"
}

variable "tenant_id" {
  type        = string
  description = "Service Principal tenant_id"
}

variable "subscription_id" {
  type        = string
}

variable "dbx_client_id" {
  type        = string
  description = "Databricks Client ID"
}
variable "dbx_client_secret" {
  type        = string
  description = "Databricks Client Secret"
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
