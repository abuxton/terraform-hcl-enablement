variable "name_prefix" {
  description = "Optional override for the generated label prefix."
  type        = string
  default     = null
  nullable    = true
}

variable "pet_length" {
  description = "Optional override for random_pet word count."
  type        = number
  default     = null
  nullable    = true
}

variable "separator" {
  description = "Optional override for the separator between generated words."
  type        = string
  default     = null
  nullable    = true
}

variable "ttl_hours" {
  description = "Optional override for expiration offset in hours."
  type        = number
  default     = null
  nullable    = true
}
