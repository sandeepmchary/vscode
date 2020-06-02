provider "aws" {
  region = var.region
  profile = var.profile
}


resource "aws_instance" "ec2_server" {
  ami = "ami-03ffa9b61e8d2cfda"
  instance_type = "t2.micro"
  tags = {
      Name = "check"
  }
}
