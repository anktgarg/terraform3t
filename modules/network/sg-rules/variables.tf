variable "type" {
  description = "Required: Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  type        = string
}

variable "from_port" {
  description = "Required: Start port (or ICMP type number)."
  type        = number
}

variable "to_port" {
  description = "Required: End port (or ICMP code)."
  type        = number
}

variable "protocol" {
  description = "Required: Protocol. If not icmp, icmpv6, tcp, udp."
  type        = string
}

variable "security_group_id" {
  description = "Required: Security group to apply this rule to."
  type        = string
}

variable "cidr_blocks" {
  description = "Required: List of CIDR blocks. Cannot be specified with source_security_group_id or self."
  type        = string
}

variable "description" {
  description = "Description of the rule."
  type        = string
  default     = ""
}

variable "self" {
  description = "Whether the security group itself will be added as a source to this ingress rule."
  type        = bool
  default     = "false"
}