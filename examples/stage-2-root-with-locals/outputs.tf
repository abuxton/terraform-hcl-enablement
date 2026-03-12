output "generated_label" {
  description = "Random label configured through root locals."
  value       = random_pet.label.id
}

output "created_at" {
  description = "Creation timestamp used as a base for offset calculations."
  value       = time_static.created.rfc3339
}

output "expires_at" {
  description = "Creation timestamp plus local ttl_hours."
  value       = time_offset.expires.rfc3339
}
