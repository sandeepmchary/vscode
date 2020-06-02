output "region" {
  value = "${var.region}"
}
output "ami" {
  value = "${var.ami}"
}
output "instance_type" {
  value = "${aws_instance.ec2.*.instance_type}"
}


