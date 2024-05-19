
variable "env" {}

variable "aws_region" {

    type = string

    description = "value"

    default = "value"
}

variable "instance_ami" {
  
  type = string
  description = "value"

  default = "ami-483756458"

    validation {
      
      condition = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
        error_message = "value"
    }

}


variable "instance_number" {
  
    type = object({
      
      dev  = number

      prod = number

    })

    description = "number of instances to create"

    default = {

      dev  = 1

      prod = 3

    }

}

variable "instance_type" {
  
    type = object({

      dev = string
      prod = string

    })

    description = "value"

    default = {
      dev = "t3.micro"
      prod = "t3.medium"
    }
}