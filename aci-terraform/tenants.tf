# create aci tenant
resource "aci_tenant" "engineering" {
  name        = "engineering"
  description = "engineering"
  annotation  = "tag:engineering:${terraform.workspace}"
  name_alias  = "engineering"
}
