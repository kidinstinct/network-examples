# require cisco aci provider
terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
    }
  }
}
provider "aci" {
  username = "admin"
  #  use environment variable for password
  # password  = var.aci_password
  cert_name   = var.cert_name
  private_key = file(var.cert_private_key)
  url         = var.apic_url
  insecure    = true
}
