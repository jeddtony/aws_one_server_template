terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "webserver" {
  ami = "ami-04f167a56786e4b09"
  instance_type = "t2.micro"
  # key_name = "terraform-key"
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  user_data = file("user-data.sh")
}

resource "aws_security_group" "webserver_sg" {
  name = var.security_group_name
  description = "Security group for the webserver"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "security_group_name" {
  type = string
  description = "The name of the security group"
  default = "webserver_sg"
}

output "webserver_public_ip" {
  value = aws_instance.webserver.public_ip
}
