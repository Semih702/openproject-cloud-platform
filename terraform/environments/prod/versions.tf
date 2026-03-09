terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket         = "openproject-cloud-platform-tfstate-211125458668"
    key            = "prod/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "openproject-cloud-platform-tf-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
