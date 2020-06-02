output "region" {
  value = "${var.region}"
}
output "ami" {
  value = "${aws_instance.ec2.*.ami}"
}

output "instance_type" {
  value = "${aws_instance.ec2.*.instance_type}"
}

output "ipaddress" {
  value = var.ip_address
}
