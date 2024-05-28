#ref: https://registry.terraform.io/providers/hashicorp/vault/latest/docs
#ref: https://www.youtube.com/watch?v=sIkRK33AY50&list=PLdpzxOOAlwvI0O4PeKVV1-yJoX2AqIWuf&index=7&ab_channel=Abhishek.Veeramalla

provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://ip:porta"

    auth_login {
      path = "auth/approle/login"
    
      parameters = {
        role_id = "<>"
        secret_id = "<>"
      }
    }
}


data "vault_kv_secret_v2" "example" {
  mount = "path"
  name = "path-for-this-secret"
}

resource "aws_instance" "my_instance" {
  ami = "ami-id"
  instance_type = "t2.micro"

    tags = {
      name = "test"
      secret = data.vault_kv_secret_v2.example.data["secret-data"]
    }
}


resource "aws_s3_bucket" "name" {
    bucket = data.vault_kv_secret_v2.example.data["secret-data"]
}
