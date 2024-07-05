module "gcp-basic" {
  source                = "../modules/m-gcp-workspace-basic"
  databricks_account_id = var.databricks_account_id
  google_project        = var.google_project
  google_region         = var.google_region
  prefix                = var.prefix
  metastore_owner       = var.metastore_owner
  service_account       = var.databricks_google_service_account

  providers = {
    databricks = databricks.mws
  }
}
