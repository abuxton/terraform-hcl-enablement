output "generated_label" {
  description = "Randomly generated label from the root module."
  value       = random_pet.label.id
}

output "created_at" {
  description = "RFC3339 timestamp captured at apply time."
  value       = time_static.created.rfc3339
}
