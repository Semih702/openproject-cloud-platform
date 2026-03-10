module "vpc" {
  source = "../../modules/vpc"

  name                 = "${var.project_name}-${var.environment}-vpc"
  vpc_cidr             = var.vpc_cidr
  az_count             = var.az_count
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

module "eks" {
  source = "../../modules/eks"

  cluster_name                    = "${var.project_name}-${var.environment}-eks"
  cluster_version                 = var.eks_cluster_version
  subnet_ids                      = module.vpc.private_subnet_ids
  endpoint_public_access          = var.eks_endpoint_public_access
  endpoint_private_access         = var.eks_endpoint_private_access
  endpoint_public_access_cidrs    = var.eks_endpoint_public_access_cidrs
  bootstrap_cluster_creator_admin = var.eks_bootstrap_cluster_creator_admin
  cluster_admin_principal_arns    = var.eks_cluster_admin_principal_arns
  node_group_name                 = var.eks_node_group_name
  node_subnet_ids                 = module.vpc.private_subnet_ids
  node_instance_types             = var.eks_node_instance_types
  node_capacity_type              = var.eks_node_capacity_type
  node_desired_size               = var.eks_node_desired_size
  node_min_size                   = var.eks_node_min_size
  node_max_size                   = var.eks_node_max_size
  node_disk_size                  = var.eks_node_disk_size
  node_update_max_unavailable     = var.eks_node_update_max_unavailable

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

module "rds_postgres" {
  source = "../../modules/rds-postgres"

  name                    = "${var.project_name}-${var.environment}-postgres"
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.private_subnet_ids
  allowed_cidr_blocks     = var.rds_allowed_cidr_blocks
  db_name                 = var.rds_db_name
  master_username         = var.rds_master_username
  master_password         = var.rds_master_password
  instance_class          = var.rds_instance_class
  allocated_storage       = var.rds_allocated_storage
  max_allocated_storage   = var.rds_max_allocated_storage
  engine_version          = var.rds_engine_version
  backup_retention_period = var.rds_backup_retention_period
  multi_az                = var.rds_multi_az
  deletion_protection     = var.rds_deletion_protection
  skip_final_snapshot     = var.rds_skip_final_snapshot

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
