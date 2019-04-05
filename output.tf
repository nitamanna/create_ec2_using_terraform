output "public_instance_ip" {
	  value = ["${aws_instance.my-terra-Instance.public_ip}"]
	}
