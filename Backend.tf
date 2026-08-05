#terraform {
#  required_version = ">= 1.5.0"
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 5.0"
#    }
#  }
#}
#
#provider "aws" {
#  region = "us-east-1"
#}
#
#resource "aws_vpc" "main" {
#  cidr_block           = "10.0.0.0/16"
#  enable_dns_hostnames = true
#  enable_dns_support   = true
#
#  tags = {
#    Name = "devops-vpc"
#  }
#}
#
#resource "aws_s3_bucket" "demo_bucket" {
#  bucket = "aws-devops-demo-bucket-${random_id.bucket_id.hex}"
#  acl    = "private"
#
#  tags = {
#    Name        = "devops-demo-bucket"
#    Environment = "dev"
#  }
#}
#
#resource "random_id" "bucket_id" {
#  byte_length = 4
#}
#
#output "vpc_id" {
#  value = aws_vpc.main.id
#}
#
#output "s3_bucket_name" {
#  value = aws_s3_bucket.demo_bucket.bucket
#}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-2028"
    key            = "devops-demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    use_lockfile   = true
  }
}


