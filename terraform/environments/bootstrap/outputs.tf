output "state_bucket_name" {
  description = "Remote state S3 bucket name"
  value       = local.effective_state_bucket_name
}

output "lock_table_name" {
  description = "DynamoDB state lock table name"
  value       = aws_dynamodb_table.tf_locks.name
}
