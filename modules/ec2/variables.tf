variable "env_name" {
    description = "The name of the environment (e.g., dev, staging, prod)."
    type        = string
    default     = "dev"
}

variable "ami_id" {
    description = "The ID of the AMI to use for EC2 instances."
    type        = string
    default     = "ami-0ec10929233384c7f" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "instance_type" {
    description = "The type of EC2 instance to launch."
    type        = string
    default     = "t2.micro"
}

variable "key_pair_name" {
    description = "The name of the existing EC2 Key Pair to use for SSH access."
    type        = string
    default     = "test"
}

variable "private_subnet_ids" {
    description = "The ID of the subnet to launch EC2 instances in."
    type        = list(string)
}

variable "vpc_id" {
    description = "The ID of the VPC to launch EC2 instances in."
    type        = string
}

variable "pub_subnet_ids" {
    description = "The ID of the public subnet to launch EC2 instances in."
    type        = list(string) 
}

variable "security_group_id" {
    description = "The ID of the security group to associate with EC2 instances."
    type        = string
}