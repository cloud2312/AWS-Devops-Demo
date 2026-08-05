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

# New resource for ACL
resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "private"
}
