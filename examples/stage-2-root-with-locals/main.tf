locals {
  name_prefix = "stage2"
  pet_length  = 2
  separator   = "-"
  ttl_hours   = 6
}

resource "random_pet" "label" {
  prefix    = local.name_prefix
  length    = local.pet_length
  separator = local.separator
}

resource "time_static" "created" {}

resource "time_offset" "expires" {
  base_rfc3339 = time_static.created.rfc3339
  offset_hours = local.ttl_hours
}
