terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "devops-project-tfstate-kunal21-4821"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "devops-project-tflock"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}
