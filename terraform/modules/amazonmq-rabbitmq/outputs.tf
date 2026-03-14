output "broker_id" {
  description = "Amazon MQ broker ID"
  value       = aws_mq_broker.this.id
}

output "broker_arn" {
  description = "Amazon MQ broker ARN"
  value       = aws_mq_broker.this.arn
}

output "broker_endpoint" {
  description = "RabbitMQ endpoint for AMQPS clients"
  value       = aws_mq_broker.this.instances[0].endpoints[0]
}

output "credentials_secret_arn" {
  description = "Secrets Manager ARN containing RabbitMQ credentials and endpoint"
  value       = aws_secretsmanager_secret.credentials.arn
}
