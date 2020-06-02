resource "aws_instance" "ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  root_block_device{
      volume_size = "${var.volume_size}"
  }
  tags = {
      Name = "${var.name}"
  }
  security_groups = ["ourgroup1"]
}
resource "aws_security_group" "group" {
  name = "ourgroup1"
  tags = {
      Name = "ourgroup1"
  }
}
resource "aws_security_group_rule" "single" {
  type = "ingress"
  from_port = "8080"
  to_port = "8080"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group.id}"
}
resource "aws_security_group_rule" "certificate" {
  type = "ingress"
  from_port = "443"
  to_port = "443"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group.id}"
}
resource "aws_security_group_rule" "ranges" {
  type = "ingress"
  from_port = "998"
  to_port = "999"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group.id}"
  
}



