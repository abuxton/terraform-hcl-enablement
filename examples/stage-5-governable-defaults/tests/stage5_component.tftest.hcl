run "inherited_default_behavior" {
  command = apply

  assert {
    condition     = length(output.generated_label) > 0
    error_message = "generated_label must not be empty."
  }

  assert {
    condition     = can(regex("^stage5-", output.generated_label))
    error_message = "generated_label must start with stage5- when defaults are used."
  }

  assert {
    condition     = output.effective_ttl_hours == 24
    error_message = "effective_ttl_hours should be the default value of 24."
  }
}

run "governed_overrides" {
  command = apply

  variables {
    name_prefix = "governed"
    pet_length  = 3
    separator   = "_"
    ttl_hours   = 2
  }

  assert {
    condition     = can(regex("^governed_", output.generated_label))
    error_message = "generated_label must reflect override prefix and separator."
  }

  assert {
    condition     = output.effective_ttl_hours == 2
    error_message = "effective_ttl_hours should reflect the override value."
  }
}
