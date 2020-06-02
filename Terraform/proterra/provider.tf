provider "aws" {
  region = us-east-2
  shared_credentials_file = "/home/centos/.aws/credentials"
  profile = var.aws_profile
}