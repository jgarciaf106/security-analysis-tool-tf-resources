resource "databricks_metastore" "this" {
  name          = "${var.prefix}-metastore"
  region        = var.google_region
  storage_root  = google_storage_bucket.unity_metastore.url
  owner         = var.metastore_owner
  force_destroy = true

  depends_on = [
    google_storage_bucket.unity_metastore,
    google_storage_bucket_iam_member.unity_sa_admin,
    google_storage_bucket_iam_member.unity_sa_reader
  ]
}

resource "databricks_metastore_assignment" "this" {
  workspace_id         = var.databricks_workspace_id
  metastore_id         = databricks_metastore.this.id
  default_catalog_name = "main"

  depends_on = [databricks_metastore.this]
}
