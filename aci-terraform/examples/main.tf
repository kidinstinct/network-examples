locals {
  access_policies = {
    vlan_pools = [
      {
        name        = join("_", ["baremetal", terraform.workspace])
        name_alias  = join("_", ["baremetal", terraform.workspace])
        annotation  = join(":", ["tag", "baremetal", terraform.workspace])
        description = "Vlan pool for baremetal domain in ${terraform.workspace} environment"
        alloc_mode  = "static"
      },
      {
        name        = join("_", ["vmm", terraform.workspace])
        name_alias  = join("_", ["vmm", terraform.workspace])
        annotation  = join(":", ["tag", "vmm", terraform.workspace])
        description = "Vlan pool for vmm domain in ${terraform.workspace} environment"
        alloc_mode  = "dynamic"
      }
    ]
    vlan_ranges = [
      {
        from       = "vlan-100"
        to         = "vlan-199"
        range_role = "external"
        alloc_mode = "static"
      },
      {
        from       = "vlan-1100"
        to         = "vlan-1199"
        range_role = "external"
        alloc_mode = "inherit"
      }
    ]
  }
}

module "aci" {
  source    = "../modules/access_policies"
  providers = { aci = aci.aci5_cert }

  environment = var.environment
  vlan_pools  = local.access_policies.vlan_pools
  vlan_ranges = local.access_policies.vlan_ranges
  # leaf_profile_name = "leaf_101_102_baremetal"
}
