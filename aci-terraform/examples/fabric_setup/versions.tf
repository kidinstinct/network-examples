# require cisco aci provider
terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
    }
  }
}

provider "aci" {
  alias       = "aci5_cert"
  username    = var.apic_username
  cert_name   = var.cert_name
  private_key = file(var.cert_private_key)
  url         = var.apic5_url
  insecure    = var.is_insecure
}

provider "aci" {
  alias    = "aci5_passwd"
  username = var.apic_username
  password = var.apic_password
  url      = var.apic5_url
  insecure = var.is_insecure
}

provider "aci" {
  alias       = "aci6_cert"
  username    = var.apic_username
  cert_name   = var.cert_name
  private_key = file(var.cert_private_key)
  url         = var.apic6_url
  insecure    = var.is_insecure
}

provider "aci" {
  alias    = "aci6_passwd"
  username = var.apic_username
  password = var.apic_password
  url      = var.apic6_url
  insecure = var.is_insecure
}
