terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.41.0"
        }
    }
    required_version = ">= 1.0"
    backend "s3" {
        bucket = "santhosh-jaddu-terraform-state-bucket"
        key    = "dev/terraform.tfstate"
        region = "us-west-2"
        dynamodb_table = "terraform_locks"
    }
}

provider "aws" {
    region = var.aws_region
}


