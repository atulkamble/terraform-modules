terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "base" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = "base-instance"
}

module "dev" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type_dev
  instance_name = "dev-instance"
}

module "prod" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type_prod
  instance_name = "prod-instance"
}
