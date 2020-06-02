resource "aws_instance" "logo1" {
  ami = var.ami
  instance_type = var.instance_type 
  count = var.counta
  associate_public_ip_address = var.ip_address

  root_block_device{
      volume_size = var.volume_size
  }
   tags = {
       Name = var.name
   }
}

