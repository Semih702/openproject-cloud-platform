output "replication_group_id" {
  description = "ElastiCache replication group ID"
  value       = aws_elasticache_replication_group.this.id
}

output "primary_endpoint_address" {
  description = "Primary Redis endpoint address"
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "port" {
  description = "Redis port"
  value       = var.port
}

output "credentials_secret_arn" {
  description = "Secrets Manager ARN containing Redis endpoint and auth token"
  value       = aws_secretsmanager_secret.credentials.arn
}
