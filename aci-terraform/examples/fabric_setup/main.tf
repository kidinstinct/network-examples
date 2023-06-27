module "fabric_setup" {
  source               = "../../modules/fabric_setup"
  providers            = { aci = aci.aci6_cert }
  fabric_nodes         = local.fabric_nodes
  fabric_wide_settings = local.fabric_wide_settings
  bgp_as_info          = local.bgp_as_info
  bgp_rrs              = local.bgp_rrs
}
