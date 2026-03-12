locals {
  name_prefix = "stage3"
  pet_length  = 2
  separator   = "-"
  ttl_hours   = 12
}

module "nested_label" {
  source = "./modules/nested_label"

  name_prefix = local.name_prefix
  pet_length  = local.pet_length
  separator   = local.separator
  ttl_hours   = local.ttl_hours
}
