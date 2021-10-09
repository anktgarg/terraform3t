## tags
variable "default_tags" {}

## VPC
variable "cidr" {
    type = string
}

## Subnets
variable "cidr_private-2a" {
    type = string
}
variable "cidr_private-2b" {
    type = string
}
variable "cidr_public-2a" {
    type = string
}
variable "cidr_public-2b" {
    type = string
}
variable "availability_zone-2a" {
    type = string
}
variable "availability_zone-2b" {
    type = string
}

variable "destination_cidr_block-public_route" {
    type = string
}