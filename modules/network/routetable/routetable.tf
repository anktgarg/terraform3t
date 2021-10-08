resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.igw
  }

  tags = {
    Name = "example"
  }
}
