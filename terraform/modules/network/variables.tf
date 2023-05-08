variable "tags" {
  type = map
  default = {
    Name    = "Terraform-test"
    Project = "2023_internship_yvn"
    Owner   = "gavetisyan"
  }
}

variable "cidr_block_vpc" {
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_block_subnet" {
  type = string
  default = "10.0.1.0/24"
}

variable "ingress_ips" {
  type = list(string)
  default = ["139.45.214.21/32"]
}