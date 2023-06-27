locals {
  fabric_wide_settings = [{
    name                        = "fabric_wide_settings"
    disable_ep_dampening        = "yes"
    domain_validation           = "yes"
    enable_remote_leaf_direct   = "yes"
    enforce_subnet_check        = "yes"
    restrict_infra_vlan_traffic = "yes"
    unicast_xr_ep_learn_disable = "yes"
    validate_overlapping_vlans  = "yes"
  }]
  bgp_as_info = {
    asn  = "65000"
    name = "default"
  }
  bgp_rrs = [
    {
      name    = "spine103"
      node_id = 103
      pod_id  = 1
    },
    {
      name    = "spine104"
      node_id = 104
      pod_id  = 1
    }
  ]
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
