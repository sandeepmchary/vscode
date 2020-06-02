resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "samdevops"
  security_groups = ["launch-wizard-1"]
  associate_public_ip_address = var.ip_address
  region = var.region
}