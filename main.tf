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

resource "aws_vpc" "myvpc" {
  cidr_block  =  "15.0.0.0/16"
}

output "vpc" {

    value = aws_vpc.myvpc.id
}