# require cisco aci provider
terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
    }
  }
}

# create fabric node member
resource "aci_fabric_node_member" "this" {
  for_each    = length(var.fabric_nodes) > 0 ? { for v in var.fabric_nodes : v.node_id => v } : {}
  serial      = each.value.serial
  name        = each.value.name
  name_alias  = each.value.name_alias
  annotation  = each.value.annotation != "" ? each.value.annotation : ""
  description = each.value.description != "" ? each.value.description : ""
  ext_pool_id = each.value.ext_pool_id != "" ? each.value.ext_pool_id : "0"
  node_id     = each.value.node_id != "" ? each.value.node_id : "101"
  node_type   = each.value.node_id != "" ? each.value.node_type : "unspecified"
  fabric_id   = each.value.fabric_id != "" ? each.value.fabric_id : "1"
  pod_id      = each.value.pod_id != "" ? each.value.pod_id : "1"
  role        = each.value.role != "" ? each.value.role : "unspecified"
}

# create fabric wide settings
resource "aci_fabric_wide_settings" "this" {
  for_each                    = length(var.fabric_wide_settings) > 0 ? { for v in var.fabric_wide_settings : v.name => v } : {}
  name                        = each.value.name != "" ? each.value.name : "default"
  annotation                  = each.value.annotation != "" ? each.value.annotation : ""
  description                 = each.value.description != "" ? each.value.description : ""
  name_alias                  = each.value.name_alias != "" ? each.value.name_alias : ""
  disable_ep_dampening        = each.value.disable_ep_dampening != "" ? each.value.disable_ep_dampening : "no"
  domain_validation           = each.value.domain_validation != "" ? each.value.domain_validation : "no"
  enable_remote_leaf_direct   = each.value.enable_remote_leaf_direct != "" ? each.value.enable_remote_leaf_direct : "no"
  enforce_subnet_check        = each.value.enforce_subnet_check != "" ? each.value.enforce_subnet_check : "no"
  restrict_infra_vlan_traffic = each.value.restrict_infra_vlan_traffic != "" ? each.value.restrict_infra_vlan_traffic : "no"
  unicast_xr_ep_learn_disable = each.value.unicast_xr_ep_learn_disable != "" ? each.value.unicast_xr_ep_learn_disable : "no"
  validate_overlapping_vlans  = each.value.validate_overlapping_vlans != "" ? each.value.validate_overlapping_vlans : "no"
}
