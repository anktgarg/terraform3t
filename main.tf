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

module "terra-test1" {
  source="./modules/network/vpc"

  cidr          = "11.0.0.0/16"
}

module "private-1a" {
  source="./modules/network/subnets"

  vpc_id     = aws_vpc.terra-test1.id
  cidr       = "11.0.1.0/24"
  azone = "us-west-1a"
}