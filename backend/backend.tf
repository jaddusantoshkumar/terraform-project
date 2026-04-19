terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.41.0"
        }
    }
    required_version = ">= 1.0"
}

provider "aws" {
    region = var.aws_region
}

resource "aws_s3_bucket" "backend" {
    bucket = var.tf_state_bucket
    region = var.aws_region
    tags = {
        Name = "${var.env_name}-tf-state-bucket"
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name         = "terraform_locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}