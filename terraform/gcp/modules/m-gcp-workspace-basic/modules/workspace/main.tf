resource "databricks_mws_workspaces" "databricks_workspace" {
  account_id      = var.databricks_account_id
  workspace_name  = "${var.prefix}-ws"
  deployment_name = "${var.prefix}-ws"

  location = var.google_region
  cloud_resource_container {
    gcp {
      project_id = var.google_project
    }
  }

  token {
    comment = "SAT Workspace Token"
    lifetime_seconds = 172800
  }
}

