output "generated_label" {
  description = "Generated label value from random_pet."
  value       = random_pet.label.id
}

output "created_at" {
  description = "RFC3339 creation timestamp from time_static."
  value       = time_static.created.rfc3339
}

output "expires_at" {
  description = "RFC3339 expiration timestamp from time_offset."
  value       = time_offset.expires.rfc3339
}
