terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"  
  access_key = "xxx"
  secret_key = "xxx"

}

resource "aws_vpc" "default_vpc"{
  cidr_block = "10.0.0.0/16"  
  instance_tenancy = "default"

  tags = {
    Name = "terraform_vpc"
  }
}


resource "aws_default_security_group" "default" {
  vpc_id =  aws_vpc.default_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.default_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "subnet_public"
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.default_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet_private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name = "gw_internet"
  }
}


resource "aws_nat_gateway" "nat_gw" {

  connectivity_type = "private"
  subnet_id = aws_subnet.subnet_private.id

  tags = {
    Name = "nat_gw"
  }


}


resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.default_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {

    Name = "rt_public"
  }
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.default_vpc.id
  

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  
  tags = {
    Name = "rt_private"
  }
}


resource "aws_route_table_association" "rt_association_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rta_association_private" {
  subnet_id      = aws_subnet.subnet_private.id
  route_table_id = aws_route_table.rt_private.id
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa  xxxxx"
}

resource "aws_instance" "ec2_public" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet_public.id
  key_name = aws_key_pair.deployer.id
  tags = {
    Name = "ec2_public"
  }
}

resource "aws_instance" "ec2_private" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_private.id
  key_name =  aws_key_pair.deployer.id
  tags = {
    Name = "ec2_private"
  }
}