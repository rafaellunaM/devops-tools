provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "This is AMI for the instace"
}

variable "instace_type" {
  description = "This is the instance type, for example: t2.micro"
}

resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instace_type
}