module "fabric_setup" {
  source               = "../modules/fabric_setup"
  providers            = { aci = aci.aci5_cert }
  fabric_nodes         = local.fabric_nodes
  fabric_wide_settings = local.fabric_wide_settings
  bgp_as_info          = local.bgp_as_info
  bgp_rrs              = local.bgp_rrs
}

module "aci" {
  source      = "../modules/access_policies"
  providers   = { aci = aci.aci5_cert }
  environment = var.environment
  vlan_pools  = local.access_policies.vlan_pools
  vlan_ranges = local.access_policies.vlan_ranges
  # leaf_profile_name = "leaf_101_102_baremetal"
}
