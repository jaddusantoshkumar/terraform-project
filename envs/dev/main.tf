module "vpc" {
  source = "../../modules/vpc"
  env_name = "dev"
  vpc_cidr_block = "10.0.0.0/16"
}

module "ec2" {
  source = "../../modules/ec2"
  env_name = "dev"
  ami_id = "ami-0d76b909de1a0595d"
  instance_type = "t2.micro"
  key_pair_name = "test"
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.vpc_id
  pub_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id
}