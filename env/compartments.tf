/************************************************************
Compartment - dns-public-zone-delegation
************************************************************/
resource "oci_identity_compartment" "dns_public_zone_delegation" {
  compartment_id = var.tenancy_ocid
  name           = "dns-public-zone-delegation"
  description    = "For DNS Public Zone Delegation"
  enable_delete  = true
}