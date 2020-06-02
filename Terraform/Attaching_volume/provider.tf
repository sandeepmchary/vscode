provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "/home/google/.aws/credentials"
  profile                 = "batman"
}
