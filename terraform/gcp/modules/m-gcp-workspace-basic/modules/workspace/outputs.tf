output "databricks_workpace_host" {
  value = databricks_mws_workspaces.databricks_workspace.workspace_url
}

output "databricks_workspace_id" {
  value = databricks_mws_workspaces.databricks_workspace.workspace_id
}

output "databricks_workspace_pat" {
  value = databricks_mws_workspaces.databricks_workspace.token[0].token_value
  sensitive = true
}