resource "random_pet" "label" {
  prefix    = var.name_prefix
  length    = var.pet_length
  separator = var.separator
}

resource "time_static" "created" {}

resource "time_offset" "expires" {
  base_rfc3339 = time_static.created.rfc3339
  offset_hours = var.ttl_hours
}
