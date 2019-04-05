provider "aws" {
region = "${var.region}"
}

#module
	module "networkModule" {
	  source = "./module/network"
	}
	
#resources
	resource "aws_key_pair" "ec2key" {
	  key_name = "ec2-terra-publicKey"
          public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCXhK3mfOWCUDpp9lmb5vnI+SGdfDqS0WSlOonXMv5zwmqM12MDYiM4K8A5nohaMxkqrLygVzWdUfVsP0x1FR0E10hcDUrAsH8NobemUAUg4igJahdH7DnKsHAYtxjMmcBWvec4lo9x4b9K0eoamAYl5WeLknJuOPy8XlJV1WyCyYtPEVHmkEJy4h50x9qQwz8qmCQVV/i32h7UB94gtqP5LM3Ut6gg+q2wyIMDpDM3csCNkk8haKH3SB+EhdxU1KNyugbnL2E+i5SHLYL5DHkxXtPlQp0JDSjyNder3HwzcbVsIgP1nugs7FKknulHuj86u+speLtvj/Ng7+xEMcEB nm-ec2-keypair01"
}
	
resource "aws_instance" "my-terra-Instance" {
	  ami           = "${var.instance_ami}"
	  instance_type = "${var.instance_type}"
	  subnet_id = "${module.networkModule.public_subnet_id}"
	  vpc_security_group_ids = ["${module.networkModule.sg_22_id}"]
	
	  tags {
			"Name" = "${var.environment_tag}"
		}
	} 
