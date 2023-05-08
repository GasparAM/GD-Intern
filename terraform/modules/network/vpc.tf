terraform {
  required_version = ">= 1.2.0"
}

resource "aws_vpc" "tf" {
  cidr_block          = var.cidr_block_vpc
  instance_tenancy    = "default"
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.tf.id
  route_table_id = aws_route_table.tf.id
}

resource "aws_subnet" "tf" {
  vpc_id                  = aws_vpc.tf.id
  cidr_block              = var.cidr_block_subnet
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "tf" {
  vpc_id = aws_vpc.tf.id
}

resource "aws_route_table" "tf" {
  vpc_id = aws_vpc.tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf.id
  }
}

resource "aws_security_group" "tf" {
  vpc_id = aws_vpc.tf.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ingress_ips
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingress_ips
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress_ips
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
