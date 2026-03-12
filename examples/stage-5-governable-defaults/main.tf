locals {
  defaults = {
    name_prefix = "stage5"
    pet_length  = 2
    separator   = "-"
    ttl_hours   = 24
  }

  effective = {
    # coalesce will use the first non-null value, allowing for variable overrides with defaults https://developer.hashicorp.com/terraform/language/functions/coalesce
    name_prefix = coalesce(var.name_prefix, local.defaults.name_prefix)
    pet_length  = coalesce(var.pet_length, local.defaults.pet_length)
    separator   = coalesce(var.separator, local.defaults.separator)
    ttl_hours   = coalesce(var.ttl_hours, local.defaults.ttl_hours)
  }
}

module "utility_component" {
  # equivilant to an example of sourcing registry.terraform.io/abuxton/utility_component/local
  source = "./components/utility_component"

  name_prefix = local.effective.name_prefix
  pet_length  = local.effective.pet_length
  separator   = local.effective.separator
  ttl_hours   = local.effective.ttl_hours
}
