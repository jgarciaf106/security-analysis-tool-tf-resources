module "gcp-basic" {
  source                = "./modules/workspace"
  databricks_account_id = var.databricks_account_id
  google_project        = var.google_project
  google_region         = var.google_region
  prefix                = var.prefix
}

module "gcp-unity-catalog" {
  source                  = "./modules/gcp-uc-metastore"
  prefix                  = var.prefix
  google_project          = var.google_project
  google_region           = var.google_region
  databricks_workspace_id = module.gcp-basic.databricks_workspace_id
  metastore_owner         = var.metastore_owner
  bucket_service_account  = var.service_account

  depends_on = [
    module.gcp-basic
  ]
}