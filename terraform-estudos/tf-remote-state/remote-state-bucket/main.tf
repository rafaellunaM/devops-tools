terraform {
  
  required_version = "value"

  required_providers {
    
    aws ={
        source = "value"
        version = "value"
    }
  }

}

provider "aws" {
  
    region = ""
    profile = ""
}

data "aws_caller_identity" "current" {}


# as vars podem ser passadas ao executar o comando de  terraform init -backend=true -backend-config="key=value" -backend-config="key=value"
# ou pode ser passado um arquivo terraform init  -backend=true -backend-config="backend.hcl"
resource "aws_s3_bucket" "remote-state" {

    bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
    

    version {

        enable = true
    }
  
    tags = {
        description = ""
    }
}