output "bucket_name" {
  description = "Name of bucket"
  value       = aws_s3_bucket.tf_s3bucket.id
}

output "bucket_region" {
  description = "Region of bucket"
  value       = aws_s3_bucket.tf_s3bucket.region
}

output "kms_key" {
  description = "ID of KMS key"
  value       = aws_kms_key.tf_bucket_key.key_id
}

output "dynamodb_table_name" {
  description = "Name of Dynamodb table"
  value       = aws_dynamodb_table.tf_dynamodb.id
}