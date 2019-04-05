# Variables
	variable "region" {
	  default = "us-east-1"
	}
	variable "instance_ami" {
	  description = "AMI for aws EC2 instance"
	  default = "ami-0080e4c5bc078760e"
	}
	variable "instance_type" {
	  description = "type for aws EC2 instance"
	  default = "t2.micro"
	}
	variable "environment_tag" {
	  description = "Name tag"
	  default = "my-terra-ec2-instance"
	}
