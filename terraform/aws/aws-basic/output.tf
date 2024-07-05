output "databricks_workpace_host" {
  value = module.aws_workspace_basic.databricks_workspace_host
}
output "databricks_workspace_id" {
  value = module.aws_workspace_basic.databricks_workspace_id
}

output "databricks_workspace_pat" {
  value     = module.aws_workspace_basic.databricks_workspace_pat
  sensitive = true
}