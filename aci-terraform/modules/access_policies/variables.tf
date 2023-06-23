

variable "environment" {
  description = "Environment"
  default     = "dev"
}

variable "vlan_pools" {
  description = "Name"
  type = list(object({
    name        = string
    name_alias  = string
    annotation  = string
    description = string
    alloc_mode  = string
  }))

  default = [{
    alloc_mode  = "static"
    annotation  = "value"
    description = "value"
    name        = "value"
    name_alias  = "value"
  }]
}

variable "vlan_ranges" {
  description = "VLAN ranges for created VLAN pools"
  type = list(object({
    from       = string
    to         = string
    range_role = string
    alloc_mode = string
  }))

  default = [{
    from       = "value"
    to         = "value"
    range_role = "value"
    alloc_mode = "inherit"
  }]
}
