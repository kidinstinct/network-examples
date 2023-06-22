variable "name" {
  description = "Name"
  default     = "aci-terraform"
}

variable "apic_username" {
  description = "Username for APIC"
  default     = "admin"
}


variable "apic_password" {
  description = "Password for APIC"
  default     = "cisco123"
}

variable "apic_url" {
  description = "URL for APIC"
  default     = "https://sandboxapicdc.cisco.com"
}

variable "cert_name" {
  description = "Certificate name"
  default     = "sandboxapicdc.cisco.com"
}

variable "cert_private_key" {
  description = "Certificate private key"
  default     = "sandboxapicdc.cisco.com.key"
}

variable "environment" {
  description = "Environment"
  default     = "dev"
}

variable "vlan_alloc_mode" {
  description = "Vlan allocation mode"
  default     = "static"
}

variable "vlan_from" {
  description = "Vlan pool range from"
  default     = "vlan-100"
}

variable "vlan_to" {
  description = "Vlan pool range to"
  default     = "vlan-199"
}

variable "vlan_range_role" {
  description = "Vlan pool range role"
  default     = "external"
}

variable "is_insecure" {
  description = "Insecure flag"
  default     = true
}

variable "leaf_profile_name" {
  description = "Leaf profile name"
  default     = "leaf_101"
}

