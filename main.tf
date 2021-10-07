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

resource "aws_vpc" "terra-test" {
  cidr_block = "10.0.0.0/16"
}

module "terra-test1" {
  source="./modules/"

  cidr_block           = "11.0.0.0/16"

}
