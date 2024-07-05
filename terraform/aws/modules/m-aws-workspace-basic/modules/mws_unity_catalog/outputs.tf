output "metastore_s3_bucket" {
  value = aws_s3_bucket.metastore.id
}
output "metastore_data_access_name" {
  value = aws_iam_role.metastore_data_access.name
}
output "metastore_data_access_arn" {
  value = aws_iam_role.metastore_data_access.arn
}
