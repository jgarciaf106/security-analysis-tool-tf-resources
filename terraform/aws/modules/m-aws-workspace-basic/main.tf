module "my_unity_catalog" {
  source                = "./modules/mws_unity_catalog"
  databricks_account_id = var.databricks_account_id
  aws_account_id        = var.aws_account_id
  prefix                = var.prefix
  tags                  = var.tags
}

// Create UC metastore
resource "databricks_metastore" "this" {
  name          = "${var.prefix}-metastore"
  storage_root  = "s3://${module.my_unity_catalog.metastore_s3_bucket}/metastore"
  owner         = var.metastore_owner
  region        = var.region
  force_destroy = true
}

resource "databricks_metastore_data_access" "this" {
  metastore_id = databricks_metastore.this.id
  name         = module.my_unity_catalog.metastore_data_access_name
  aws_iam_role {
    role_arn = module.my_unity_catalog.metastore_data_access_arn
  }
  is_default    = true
  force_destroy = true
  depends_on = [
    module.my_unity_catalog
  ]
}

resource "databricks_metastore_assignment" "default_metastore" {
  workspace_id         = databricks_mws_workspaces.this.workspace_id
  metastore_id         = databricks_metastore.this.id
  default_catalog_name = "main"
}




