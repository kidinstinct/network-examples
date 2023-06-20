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
  password = var.aci_password
  url      = var.apic_url
  insecure = true
}

# create vlan pool
resource "aci_vlan_pool" "baremetal" {
  name        = "baremetal_domain_pool"
  description = "Vlan pool for baremetal domain"
  alloc_mode  = "static"
  annotation  = "baremetal"
  name_alias  = "baremetal"
}

# create vlan pool range
# resource "aci_ranges" "baremetal" {
#   vlan_pool_dn = aci_vlan_pool.baremetal.id
#   description  = "Vlan pool range for baremetal domain"
#   from         = 100
#   to           = 199
#   alloc_mode   = "inherit"
#   annotation   = "baremetal"
#   name_alias   = "baremetal"
#   role         = "external"
# }
