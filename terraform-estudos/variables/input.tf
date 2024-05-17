
# link ref: https://developer.hashicorp.com/terraform/language/values/variables
# São argumentos de funções

#formas de passar variáveis para o terraform
#exemplo com default:

variable "aws_region" {

  type = string
  description = "value"
  default = "eu-central-1"

}

variable "aws_profile" {

  type = string
  description = ""
  default = "tf014"

}

variable "instance_ami" {

  type = string
  description = "value"
  default = "ami-xxxxxx"

}

variable "instance_type" {

  type = string
  description = ""
  default = "t3.micro"

}

variable "instance_tags" {

  type = map(string)
  description = "value"
  default = {
    Name = "ubuntu"
    Project = "teste var"
  }

}


