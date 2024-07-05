variable "prefix" {
  type        = string
  description = "Prefix to use in generated service account name"
}

variable "google_project" {
  type        = string
  description = "Google project for VCP/workspace deployment"
}

variable "google_region" {
  type        = string
  description = "Google region for VCP/workspace deployment"
}

variable "databricks_workspace_id" {
  type = string
}
variable "metastore_owner" {
  type = string
}
variable "bucket_service_account" {
  type = string
}