/************************************************************
Public Zone
************************************************************/
resource "oci_dns_zone" "public_zone" {
  compartment_id = oci_identity_compartment.dns_public_zone_delegation.id
  name           = var.zone_name
  zone_type      = "PRIMARY"
  scope          = "GLOBAL"
  dnssec_state   = "DISABLED"
  defined_tags = {
    format("%s.%s", oci_identity_tag_namespace.common.name, oci_identity_tag_default.key_env.tag_definition_name)                = "prd"
    format("%s.%s", oci_identity_tag_namespace.common.name, oci_identity_tag_default.key_managedbyterraform.tag_definition_name) = "true"
  }
}

/************************************************************
Record - TXT
************************************************************/
resource "oci_dns_rrset" "txt" {
  zone_name_or_id = oci_dns_zone.public_zone.name
  domain          = "hogehoge.${var.zone_name}"
  rtype           = "TXT"
  items {
    domain = "hogehoge.${var.zone_name}"
    rtype  = "TXT"
    rdata  = "Success"
    ttl    = 3600
  }
}