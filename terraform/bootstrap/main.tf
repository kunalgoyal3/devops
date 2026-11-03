terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


resource "aws_s3_bucket" "tfstate" {
  bucket = "devops-project-tfstate-kunal21-4821"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_dynamodb_table" "tflock" {
  name         = "devops-project-tflock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "bucket_name"{
  value = aws_s3_bucket.tfstate.id
}

output "dynamodb_table" {
  value = aws_dynamodb_table.tflock.name
}















