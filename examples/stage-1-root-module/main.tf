resource "random_pet" "label" {
  length    = 2
  separator = "-"
}

resource "time_static" "created" {}
