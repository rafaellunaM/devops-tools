provider "aws" {

  region = var.aws_region
  profile = var.aws_profile

}

resource "aws_instance" "web" {
  
    ami = var.instance_ami
    instance_type = var.instance_type

    tags = var.instance_tags # não precisa de chaves, porque o tipo instance_tags já está no formato esperado das tags. Basta verificar no arquivp input.tf

}