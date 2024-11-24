module "iam" {
  source             = "./modules/iam"
  employee_user_name = "jake"
  employee_role = "devopseng"
}

module "ec2" {
  source   = "./modules/ec2"
  AZ       = "us-east-1b"
  ec2_name = module.iam.employee_user_name
}