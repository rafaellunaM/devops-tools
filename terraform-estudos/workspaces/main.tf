provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "value"
}

variable "instace_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}


module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
                    # vai buscar em instance o valor da chave de acordo com o workspace e se n encontrar vai usar micro
  instace_type = lookup(var.instace_type, terraform.workspace, "t2.micro")
}