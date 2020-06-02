resource "aws_s3_bucket" "buckets" {
  acl = "private"
  bucket = "awssamdevops85559"
  force_destroy = "true"
  versioning {
    enabled = "true"
  }
  tags = {
    Name = "samdevops85559"
  }
}
resource "aws_s3_bucket" "buckets1" {
  acl = "private"
  bucket = "awssamdevops855595"
  force_destroy = "true"
  versioning {
    enabled = "true"

  }
  tags ={
    Name = "awssamdevops855595"
  }
}