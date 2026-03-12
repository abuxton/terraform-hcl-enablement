run "default_behavior" {
  command = apply

  assert {
    condition     = length(output.generated_label) > 0
    error_message = "generated_label must not be empty."
  }

  assert {
    condition     = can(regex("^stage4-", output.generated_label))
    error_message = "generated_label must start with stage4-."
  }

  assert {
    condition     = can(regex("Z$", output.created_at))
    error_message = "created_at must be an RFC3339 UTC timestamp."
  }

  assert {
    condition     = can(regex("Z$", output.expires_at))
    error_message = "expires_at must be an RFC3339 UTC timestamp."
  }
}
