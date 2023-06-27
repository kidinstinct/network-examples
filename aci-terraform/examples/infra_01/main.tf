module "access_policies" {
  source    = "../../modules/access_policies"
  providers = { aci = aci.aci6_cert }

  environment = var.environment
  vlan_pools  = local.access_policies.vlan_pools
  vlan_ranges = local.access_policies.vlan_ranges
  # leaf_profile_name = "leaf_101_102_baremetal"
}
