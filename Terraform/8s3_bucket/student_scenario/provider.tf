provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "${var.path_file}"
  profile = "batman"
}
