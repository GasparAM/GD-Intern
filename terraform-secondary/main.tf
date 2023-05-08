terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-north-1"
}
resource "aws_vpc" "tf" {
  cidr_block       = var.ip
  instance_tenancy = "default"
  # main_route_table_id = aws_route_table.tf.id
}

resource "aws_subnet" "private" {
  for_each                = local.subnets_private
  vpc_id                  = aws_vpc.tf.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
}


resource "aws_subnet" "public" {
  for_each                = local.subnets_public
  vpc_id                  = aws_vpc.tf.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
}