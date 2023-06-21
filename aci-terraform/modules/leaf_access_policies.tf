# create vlan pool
resource "aci_vlan_pool" "baremetal" {
  name        = "baremetal_domain_pool"
  description = "Vlan pool for baremetal domain"
  alloc_mode  = "static"
  annotation  = "baremetal"
  name_alias  = "baremetal"
}

# create vlan pool range
resource "aci_ranges" "baremetal" {
  vlan_pool_dn = aci_vlan_pool.baremetal.id
  description  = "Vlan pool range for baremetal domain"
  from         = "vlan-100"
  to           = "vlan-199"
  alloc_mode   = "inherit"
  role         = "external"
}

# create physical domain
resource "aci_physical_domain" "baremetal" {
  name                      = "baremetal_domain"
  annotation                = "baremetal"
  name_alias                = "baremetal"
  relation_infra_rs_vlan_ns = aci_vlan_pool.baremetal.id
}

# create aaep
resource "aci_attachable_access_entity_profile" "baremetal" {
  name        = "baremetal_aaep"
  description = "baremetal aaep"
  annotation  = "baremetal"
  name_alias  = "baremetal"
}

# create aaep to physical domain
resource "aci_aaep_to_domain" "baremetal" {
  annotation                          = "baremetal"
  attachable_access_entity_profile_dn = aci_attachable_access_entity_profile.baremetal.id
  domain_dn                           = aci_physical_domain.baremetal.id
}

# create cdp enabled policy
resource "aci_cdp_interface_policy" "cdp_enabled" {
  name        = "cdp_enabled"
  admin_st    = "enabled"
  annotation  = "tag:cdp"
  name_alias  = "cdp_enabled"
  description = "Enable CDP"
}

#  create lldp enabled policy
resource "aci_lldp_interface_policy" "lldp_enabled" {
  name        = "lldp_enabled"
  admin_rx_st = "enabled"
  admin_tx_st = "enabled"
  annotation  = "tag:lldp"
  name_alias  = "lldp_enabled"
  description = "Enable LLDP"
}

# create miscabling protocol interface enabled policy
resource "aci_miscabling_protocol_interface_policy" "name" {
  name        = "mcp_enabled"
  admin_st    = "enabled"
  annotation  = "tag:mcp"
  name_alias  = "mcp_enabled"
  description = "Enable MCP"
}


# create leaf access policy group
resource "aci_leaf_access_port_policy_group" "baremetal" {
  name                          = "baremetal"
  description                   = "baremetal"
  annotation                    = "baremetal"
  name_alias                    = "baremetal"
  relation_infra_rs_att_ent_p   = aci_attachable_access_entity_profile.baremetal.id
  relation_infra_rs_cdp_if_pol  = aci_cdp_interface_policy.cdp_enabled.id
  relation_infra_rs_lldp_if_pol = aci_lldp_interface_policy.lldp_enabled.id
  relation_infra_rs_mcp_if_pol  = aci_miscabling_protocol_interface_policy.name.id
}

# create leaf interface profile
resource "aci_leaf_interface_profile" "baremetal" {
  name        = "baremetal"
  description = "baremetal"
  annotation  = "baremetal"
  name_alias  = "baremetal"
}

# create access port selector
resource "aci_access_port_selector" "baremetal" {
  leaf_interface_profile_dn      = aci_leaf_interface_profile.baremetal.id
  name                           = "baremetal"
  description                    = "baremetal"
  annotation                     = "baremetal"
  name_alias                     = "baremetal"
  access_port_selector_type      = "range"
  relation_infra_rs_acc_base_grp = aci_leaf_access_port_policy_group.baremetal.id
}

# create access port block
resource "aci_access_port_block" "baremetal" {
  access_port_selector_dn = aci_access_port_selector.baremetal.id
  annotation              = "baremetal"
  name                    = "baremetal"
  name_alias              = "baremetal"
  description             = "baremetal"
  from_card               = "1"
  from_port               = "1"
  to_card                 = "1"
  to_port                 = "10"
}

# create leaf profile
resource "aci_leaf_profile" "leaf_101_102_baremetal" {
  name        = "leaf_101_102_baremetal"
  description = "Access ports for baremetal on leaf101-102"
  annotation  = "leaf:baremetal"
  name_alias  = "leaf_101_102_baremetal"
  relation_infra_rs_acc_port_p = [
    aci_leaf_interface_profile.baremetal.id,
  ]
}

# create leaf selector
resource "aci_leaf_selector" "leaf_101_102" {
  leaf_profile_dn         = aci_leaf_profile.leaf_101_102_baremetal.id
  switch_association_type = "range"
  name                    = "leaf_101_102"
  description             = "leaf_101_102"
  annotation              = "leaf_101_102"
  name_alias              = "leaf_101_102"
}

# create node block
resource "aci_node_block" "leaf_101_102" {
  switch_association_dn = aci_leaf_selector.leaf_101_102.id
  annotation            = "leaf_101_102"
  name                  = "leaf_101_102"
  name_alias            = "leaf_101_102"
  description           = "leaf_101_102"
  from_                 = "101"
  to_                   = "102"
}
