#Deploy a single EC2 instance

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "< 4.0"
    }
  }
}


#Configure AWS connection
provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}


#Deploy a Single EC2 instance
resource "aws_instance" "webserver" {
  ami                    = var.AMIS[var.AWS_REGION]
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              !#/bin/bash
              echo "Hello world from webserver! > index.html"
              nohup busybox httpd -f -p "${var.server_port}"
              EOF
}


resource "aws_security_group" "instance" {
  name = "webserver-security-group"

  #Inbound connections
  ingress {
    from_port   = var.server_port
    protocol    = "http"
    to_port     = var.server_port
    cidr_blocks = ["0.0.0.0/0"]
  }
}





