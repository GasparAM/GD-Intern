variable "ip" {
    default = "10.217.144.0/21"
}

locals {
  subnetcalc = cidrsubnets(var.ip, 4, 4, 4, 2, 2, 2)
  privsubs   = element(chunklist(local.subnetcalc, 3), 0)
  pubsubs   = element(chunklist(local.subnetcalc, 3), 1)
  subnets_private = {
    "private-a" = {
      cidr_block        = local.privsubs[0]
      availability_zone = "en-north-1a"
    }
    "private-b" = {
      cidr_block = local.privsubs[1]
      availability_zone = "en-north-1b"
    }
    "private-c" = {
      cidr_block = local.privsubs[2]
      availability_zone = "en-north-1c"
    }
  }
  subnets_public = {
    "public-a" = {
      cidr_block        = local.pubsubs[0]
      availability_zone = "en-north-1a"
    }
    "public-b" = {
      cidr_block = local.pubsubs[1]
      availability_zone = "en-north-1b"
    }
    "public-c" = {
      cidr_block = local.pubsubs[2]
      availability_zone = "en-north-1c"
    }
  }
}