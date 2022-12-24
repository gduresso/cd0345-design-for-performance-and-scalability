# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2

/*resource "aws_instance" "Udacity_T2" {
  count = "4"
  ami = "ami-0fe472d8a85bc7b0e"
  instance_type = "t2.micro"
  tags = {
    Name = "Udacity Task2"
  }
}
*/

# TODO: provision 2 m4.large EC2 instances named Udacity M4
 /*resource "aws_instance" "Udacity_M4" {
   count = "2"
   ami = "ami-0c6b1d09930fac512"
   instance_type = "m4.large"
   tags = {
    Name = "Udacity M4"
  }
  
}*/

