resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "aws-devops-demo-bucket-${random_id.bucket_id.hex}"
  acl    = "private"   # ⚠️ Deprecated, consider aws_s3_bucket_acl

  tags = {
    Name        = "devops-demo-bucket"
    Environment = "dev"
  }
}
