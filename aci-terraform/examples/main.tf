module "aci" {
  source = "../modules/access_policies"

  name              = "baremetal"
  apic_url          = var.apic_url
  apic_username     = var.apic_username
  apic_password     = var.apic_password
  cert_name         = var.cert_name
  cert_private_key  = var.cert_private_key
  is_insecure       = false
  environment       = var.environment
  vlan_alloc_mode   = "static"
  vlan_from         = "vlan-100"
  vlan_to           = "vlan-199"
  vlan_range_role   = "external"
  leaf_profile_name = "leaf_101_102_baremetal"
}
