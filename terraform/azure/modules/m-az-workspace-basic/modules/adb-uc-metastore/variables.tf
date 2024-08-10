
variable "prefix" {
  type        = string
  description = "Prefix for the resources in this module"
}
variable "use_existing_resource_group" {
  type        = string
  description = "Whether a new resource group should be created or if one already exists. null = new, rg group = existing."
}

variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "metastore_storage_name" {
  type        = string
  description = "Name of the storage account for Unity Catalog metastore"
}

variable "access_connector_name" {
  type        = string
  description = "Name of the access connector for Unity Catalog metastore"
}

variable "metastore_name" {
  type        = string
  description = "the name of the metastore"
}

variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags to attach to resources"
}

variable "workspace_id" {
  type        = string
  description = "The ID of Databricks workspace"
}