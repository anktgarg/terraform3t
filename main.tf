terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
}

# resource "aws_vpc" "terra" {
#   cidr_block = "10.0.0.0/16"
# }
 
module "terra-test1" {
  source = "./modules/network/vpc"

  cidr          = "11.0.0.0/16"
}

module "private-1a" {
  source = "./modules/network/subnets"

  vpc_id     = aws_vpc.main.id
  cidr       = "11.0.1.0/24"
  azone      = "us-west-1a"
}  

output "vpc_id" {

    value = aws_vpc.main.id
}