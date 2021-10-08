
# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

 
module "main_vpc" {
  source = "./modules/network/vpc"

  cidr          = "11.0.0.0/16"
}

module "private-2a" {
  source = "./modules/network/subnets"

  vpc_id     = module.main_vpc.vpc_id
  cidr       = "11.0.1.0/24"
  azone      = "us-west-2a"
}  

module "private-2b" {
  source = "./modules/network/subnets"

  vpc_id     = module.main_vpc.vpc_id
  cidr       = "11.0.3.0/24"
  azone      = "us-west-2b"
}

module "public-2a" {
  source = "./modules/network/subnets"

  vpc_id     = module.main_vpc.vpc_id
  cidr       = "11.0.2.0/24"
  azone      = "us-west-2a"
}

module "public-2b" {
  source = "./modules/network/subnets"

  vpc_id     = module.main_vpc.vpc_id
  cidr       = "11.0.4.0/24"
  azone      = "us-west-2b"
}

module "igw" {
  source = "./modules/network/igw"

  vpc_id     = module.main_vpc.vpc_id
}

module "public-rt" {
  source = "./modules/network/routetable"

  vpc_id     = module.main_vpc.vpc_id
  igw_id     = module.igw.igw_id
}
