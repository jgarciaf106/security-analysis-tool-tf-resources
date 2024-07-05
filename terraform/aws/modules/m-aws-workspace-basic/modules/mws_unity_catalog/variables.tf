variable "prefix" {
  type = string // should be a randomized string  
}
variable "tags" {
  default     = {}
  type        = map(string)
  description = "Optional tags to add to created resources"
}
variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}
variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}