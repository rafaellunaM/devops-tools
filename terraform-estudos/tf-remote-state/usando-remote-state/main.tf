# é o bloco core do tf
# é o primeiro a ser executado, nisso nâo é possível usar vars nem interpolação
terraform {
  required_version = "value"

    required_providers {
      aws = {

        source = "value"
        version = "value"
      }
    }

    backend "s3" {
      bucket = "value"
      key = "path/to/file-terraform.tfstate"
      region = "value"
      profile = "value"
    }
}