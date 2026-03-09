output "state_bucket_name" {
  description = "Remote state S3 bucket name"
  value       = aws_s3_bucket.tf_state.bucket
}

output "lock_table_name" {
  description = "DynamoDB state lock table name"
  value       = aws_dynamodb_table.tf_locks.name
}
