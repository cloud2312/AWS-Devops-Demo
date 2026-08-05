resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "aws-devops-demo-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name        = "devops-demo-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "demo_bucket_ownership" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

