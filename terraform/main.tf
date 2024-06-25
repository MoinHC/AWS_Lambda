terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "moins-tf-bucket" {
  bucket = "moins-tf-bucket"
  lifecycle {
    prevent_destroy = true
  }
}
