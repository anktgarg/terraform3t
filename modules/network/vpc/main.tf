resource "aws_vpc" "main" {

  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(map(
        "module", "module/network/vpc"
    ), var.default_tags)
}

output "vpc_id" {

value = aws_vpc.main.id
}
