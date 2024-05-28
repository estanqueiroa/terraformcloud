resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Project VPC"
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "test" {
  bucket = "tf-cloud-github-idp-2024"

  tags = {
    Name        = "My bucket2"
    Environment = "PROD4"
    Terraform   = "Cloud"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.test.id
  versioning_configuration {
    status = "Enabled"
  }
}