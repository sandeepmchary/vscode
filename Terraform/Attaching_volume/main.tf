resource "aws_instance" "volumes-attach" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "${var.ip_address}"

  root_block_device {
    volume_size = "${var.volume_size}"
  }
  tags = {
    Name = var.name
  }
}
resource "aws_ebs_volume" "newvolume" {
  availability_zone = "${var.region}a"
  size              = 1
  tags = {
    Name = "attached_volume"
  }
  depends_on = ["aws_instance.volumes-attach"]
}

resource "aws_volume_attachment" "newattach" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.newvolume.id}"
  instance_id = "${aws_instance.volumes-attach.id}"
}


