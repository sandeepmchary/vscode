resource "aws_instance" "ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = "${var.ip_address}"
  root_block_device {
      volume_size = "${var.volume_size}"
  }
   tags = {
       Name = "${var.name}"
   }
}
resource "aws_ebs_volume" "volume1" {
  availability_zone = "${var.region}a"
  size = 1
  tags = {
      Name = "attached_volumes1"
  }
  depends_on = ["aws_instance.ec2"]
}
resource "aws_ebs_volume" "volume2" {
  availability_zone = "${var.region}a"
  size = 1
  tags = {
      Name = "attached_volume2"
  }
  depends_on = ["aws_instance.ec2"]
}
resource "aws_volume_attachment" "new_attach1" {
  device_name = "/dev/sdh"
  volume_id = "${aws_ebs_volume.volume1.id}"
  instance_id = "${aws_instance.ec2.id}"
}
resource "aws_volume_attachment" "new_attach2" {
  device_name = "dev/sdi"
  volume_id = "${aws_ebs_volume.volume2.id}"
  instance_id = "${aws_instance.ec2.id}"
}


