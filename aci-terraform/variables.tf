variable "aci_password" {
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
