resource "aws_instance" "ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  root_block_device{
      volume_size = "${var.volume_size}"
  }
  tags = {
      Name = "${var.name}"
  }
  security_groups = ["ourgroups","ourgroup1"]
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

resource "aws_security_group" "group1" {
  name = "ourgroups"
  tags ={
      Name = "OurGroup"

  }
}
resource "aws_security_group_rule" "single1" {
  type = "ingress"
  from_port = "22"
  to_port = "22"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group1.id}"
}
resource "aws_security_group_rule" "range" {
  type = "ingress"
  from_port = "1000"
  to_port = "1005"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group1.id}"
}


