variable "name" {
  description = "Replication group identifier prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where Redis security group is created"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs used by Redis subnet group"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect to Redis port"
  type        = list(string)
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.1"
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "num_cache_clusters" {
  description = "Number of cache clusters in replication group"
  type        = number
  default     = 1
}

variable "apply_immediately" {
  description = "Whether modifications are applied immediately"
  type        = bool
  default     = false
}

variable "auth_token" {
  description = "Optional Redis AUTH token override; generated when null"
  type        = string
  sensitive   = true
  default     = null
  nullable    = true
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
