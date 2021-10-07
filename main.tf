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

resource "aws_vpc" "main" {
  cidr_block  =  "10.0.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
}

resource "aws_subnet" "private-sn" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public-sn" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone  = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block = "10.0.1.0/24"
      gateway_id = aws_internet_gateway.igw.id
    }
  ]

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "private-rta" {
  subnet_id      = aws_subnet.private-sn.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "public-rta" {
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.public-rt.id
}