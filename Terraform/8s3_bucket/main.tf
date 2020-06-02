resource "aws_s3_bucket" "bucket" {
  acl = "private"
  bucket = "samdevopsaws8555"
  force_destroy = "false"
  versioning {
    enabled = "true"
  }
  tags = {
    Name = "samdevopsaws8555"
  }
}