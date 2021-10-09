variable "image_id" {
  description = "The VPC ID."
  type        = string
}

variable "instance_type" {
  description = "The VPC ID."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The VPC ID."
  type        = any
}

variable "security_groups" {
  description = "The VPC ID."
  type        = string
}


variable "associate_public_ip_address" {
  description = "The VPC ID."
  type        = bool
  default = false
}