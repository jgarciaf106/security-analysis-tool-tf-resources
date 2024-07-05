resource "google_storage_bucket" "unity_metastore" {
  name          = "${var.prefix}-bucket"
  location      = var.google_region
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "unity_sa_admin" {
  bucket = google_storage_bucket.unity_metastore.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${var.bucket_service_account}"
}

resource "google_storage_bucket_iam_member" "unity_sa_reader" {
  bucket = google_storage_bucket.unity_metastore.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:${var.bucket_service_account}"
}