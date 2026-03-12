locals {
  name_prefix = "stage4"
  pet_length  = 2
  separator   = "-"
  ttl_hours   = 18
}

module "utility_component" {
  source = "./components/utility_component"

  name_prefix = local.name_prefix
  pet_length  = local.pet_length
  separator   = local.separator
  ttl_hours   = local.ttl_hours
}
