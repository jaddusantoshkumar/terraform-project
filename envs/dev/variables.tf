variable "aws_region" {
    description = "The AWS region to deploy resources in."
    type        = string
    default     = "us-west-2"
}

variable "tf_state_bucket" {
    description = "The s3 bucket to store Terraform statefiles."
    type        = string
    default     = "santhosh-jaddu-terraform-state-bucket"
}

