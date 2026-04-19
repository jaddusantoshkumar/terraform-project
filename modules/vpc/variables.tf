variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC."
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
    description = "A list of CIDR blocks for public subnets."
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
    description = "A list of CIDR blocks for private subnets."
    type        = list(string)
    default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
    description = "A list of availability zones to deploy subnets in."
    type        = list(string)
    default     = ["us-west-2a", "us-west-2b"]
}

variable "env_name" {
    description = "The name of the environment (e.g., dev, staging, prod)."
    type        = string
    default     = "dev"
}

