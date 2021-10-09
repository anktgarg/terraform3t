variable "subnet_id" {
  description = "The CIDR block for the subnet."
  type        = any
}

variable "route_table_id" {
  description = "The VPC ID."
  type        = string
}
