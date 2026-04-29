module "vpc" {
  source = "./modules/vpc"
}

module "compute" {
  source = "./compute"

  vpc_id             = module.vpc.vpc_id
  private_subnet_id  = module.vpc.private_subnet_1_id
}