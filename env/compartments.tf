/************************************************************
Compartment - dns-public-zone-delegation
************************************************************/
resource "oci_identity_compartment" "dns_public_zone_delegation" {
  compartment_id = var.tenancy_ocid
  name           = "dns-public-zone-delegation"
  description    = "For DNS Public Zone Delegation"
  enable_delete  = true
  defined_tags = {
    format("%s.%s", oci_identity_tag_namespace.common.name, oci_identity_tag_default.key_env.tag_definition_name)                = "prd"
    format("%s.%s", oci_identity_tag_namespace.common.name, oci_identity_tag_default.key_managedbyterraform.tag_definition_name) = "true"
  }
}