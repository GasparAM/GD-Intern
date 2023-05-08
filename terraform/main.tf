terraform {
  backend "s3" {
    bucket = "terraform-internship-bucket"
    region = "eu-north-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-north-1"
  default_tags {
    tags = var.tags
  }
}

module "network" {
  source = "./modules/network"
  cidr_block_subnet = var.cidr_block_subnet
  cidr_block_vpc = var.cidr_block_vpc
  ingress_ips = var.ingress_ips
}

module "compute" {
  source = "./modules/compute"
  subnet = module.network.subnet.id
  vpc = module.network.vpc.id
  security_group = module.network.security_group.id
}





