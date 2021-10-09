
# Configure the AWS Provider
provider "aws" {
  region    = "us-west-2"
}

 
module "main_vpc" {
  source    = "./modules/network/vpc"
  cidr      = "11.0.0.0/16"
  default_tags = merge(tomap(
      {"Name" = "Test-vpc"}
    ), var.default_tags)
}

# module "private-2a" {
#   source    = "./modules/network/subnets"
#   vpc_id    = module.main_vpc.vpc_id
#   cidr      = "11.0.1.0/24"
#   availability_zone     = "us-west-2a"
#   default_tags = merge(tomap(
#       {"Name" = "Test-private-2a"}
#     ), var.default_tags)
# }  

# module "private-2b" {
#   source    = "./modules/network/subnets"
#   vpc_id    = module.main_vpc.vpc_id
#   cidr      = "11.0.3.0/24"
#   availability_zone     = "us-west-2b"
#   default_tags = merge(tomap(
#       {"Name" = "Test-private-2b"}
#     ), var.default_tags)
# }

# module "public-2a" {
#   source    = "./modules/network/subnets"
#   vpc_id    = module.main_vpc.vpc_id
#   cidr      = "11.0.2.0/24"
#   availability_zone     = "us-west-2a"
#   default_tags = merge(tomap(
#       {"Name" = "Test-public-2a"}
#     ), var.default_tags)
# }

# module "public-2b" {
#   source    = "./modules/network/subnets"
#   vpc_id    = module.main_vpc.vpc_id
#   cidr      = "11.0.4.0/24"
#   availability_zone     = "us-west-2b"
#   default_tags = merge(tomap(
#       {"Name" = "Test-public-2b"}
#     ), var.default_tags)
# }

# module "igw" {
#   source    = "./modules/network/igw"
#   vpc_id    = module.main_vpc.vpc_id
#   default_tags = merge(tomap(
#       {"Name" = "Test-igw"}
#     ), var.default_tags)
# }

module "public-rt" {
  source    = "./modules/network/routetable"
  vpc_id    = module.main_vpc.vpc_id
}

# module "private-rt" {
#   source    = "./modules/network/routetable"
#   vpc_id    = module.main_vpc.vpc_id
# }

module "public-routes" {
  source    = "./modules/network/routes"
  route_table_id            = module.public-rt.route_table_id
  destination_cidr_block    = 0.0.0.0/0
  gateway_id = module.igw.igw_id
  # nat_gateway_id = var.nat_gatway_id
}

# module "rta-2a" {
#   source    = "./modules/network/rt-association"
#   subnet_id    = module.public-2a.subnet_id
#   route_table_id    = module.public-rt.route_table_id
# }

# module "rta-2b" {
#   source    = "./modules/network/rt-association"
#   subnet_id    = module.public-2b.subnet_id
#   route_table_id   = module.public-rt.route_table_id
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }
# module "web_sg" {
#   source    = "./modules/network/sg"
#   vpc_id    = module.main_vpc.vpc_id
# }

# module "launchconfig" {
#   source    = "./modules/compute/launchconfig"
#   image_id                    = data.aws_ami.ubuntu.id
#   instance_type               = "t2.micro"
#   # key_name                    = file("/home/azureuser/key.pem")
#   security_groups             = module.web_sg.web_sg_id
#   associate_public_ip_address = false
# }

# module "web-asg" {
#   source = "./modules/compute/asg"
#   launch_configuration = module.launchconfig.lc_id
#   min_size                  = 1
#   max_size                  = 3
#   desired_capacity          = 2
# }