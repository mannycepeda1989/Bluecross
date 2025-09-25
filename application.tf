# Configure the AWS Provider
# This block specifies that we will be using the AWS provider and pins its version.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Configuration
# This block configures the AWS provider with a specific region.
provider "aws" {
  region = "us-east-1"
}

# Resource Definition
# This block defines an AWS S3 bucket resource.
# The resource is of type "aws_s3_bucket" and its local name is "example_bucket".
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-terraform-bucket-12345"
  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Dev"
  }
}

# Output Block
# This block outputs the domain name of the created S3 bucket.
# The value is retrieved from the attributes of the "example_bucket" resource.
output "bucket_domain_name" {
  value = aws_s3_bucket.example_bucket.bucket_domain_name
}
