locals {
  

  instance_number = lookup(var.instance_number, var.env)

  file_text = "zip"

  object_name = "meu-arquiv-gerado-pela-template"

  common_tags  = {
    "owner" = "rafael"
    "year" = 2024
  }
}