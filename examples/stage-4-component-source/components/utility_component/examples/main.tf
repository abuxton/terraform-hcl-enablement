

module "utility_component" {
  source      = "../.."
  name_prefix = var.effective.name_prefix
  pet_length  = var.effective.pet_length
  separator   = var.effective.separator
  ttl_hours   = var.effective.ttl_hours
}
