output "databricks_workpace_host" {
  value = module.gcp-basic.databricks_workpace_host
}

output "databricks_workspace_id" {
  value = module.gcp-basic.databricks_workspace_id
}

output "databricks_workspace_pat" {
  value = module.gcp-basic.databricks_workspace_pat
  sensitive = true
}