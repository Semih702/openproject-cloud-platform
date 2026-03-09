output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "availability_zones" {
  description = "AZs used for this VPC"
  value       = local.azs
}

output "public_subnet_ids" {
  description = "Public subnet IDs ordered by AZ"
  value       = [for az in local.azs : aws_subnet.public[az].id]
}

output "private_subnet_ids" {
  description = "Private subnet IDs ordered by AZ"
  value       = [for az in local.azs : aws_subnet.private[az].id]
}

output "nat_gateway_ids" {
  description = "NAT gateway IDs ordered by AZ"
  value       = [for az in local.azs : aws_nat_gateway.this[az].id]
}
