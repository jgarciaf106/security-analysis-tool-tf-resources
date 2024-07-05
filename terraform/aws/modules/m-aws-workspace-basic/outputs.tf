output "databricks_workspace_host" {
  value = databricks_mws_workspaces.this.workspace_url
}
output "databricks_workspace_id" {
  value = databricks_mws_workspaces.this.workspace_id
}

output "databricks_workspace_pat" {
  value     = databricks_mws_workspaces.this.token[0].token_value
  sensitive = true
}
