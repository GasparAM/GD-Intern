variable "tags" {
  type = map
}

variable "cidr_block_vpc" {
  type = string
}

variable "cidr_block_subnet" {
  type = string
}

variable "ingress_ips" {
  type = list(string)
}