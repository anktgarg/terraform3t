resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr
  availability_zone = var.azone

  tags = {
    app = "webapp"
  }
}