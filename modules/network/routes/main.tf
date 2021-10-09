resource "aws_route" "routes" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.destination_cidr_block
  gateway_id = var.igw_id
#   nat_gateway_id = var.nat_gatway_id

  tags = merge(tomap(
        { "module" = "module/network/routes" }
    ), var.default_tags)
}