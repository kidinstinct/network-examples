variable "fabric_nodes" {
  description = "List of fabric nodes to be created"
  type = list(object({
    serial      = optional(string)
    name        = optional(string)
    name_alias  = optional(string)
    annotation  = optional(string)
    description = optional(string)
    ext_pool_id = optional(string)
    fabric_id   = optional(string)
    node_id     = optional(string)
    node_type   = optional(string)
    pod_id      = optional(string)
    role        = optional(string)
  }))
  default = []
}

variable "fabric_wide_settings" {
  description = "List of fabric wide settings to be created"
  type = list(object({
    name                 = optional(string)
    annotation           = optional(string)
    description          = optional(string)
    name_alias           = optional(string)
    disable_ep_dampening = optional(string)
  }))
}
