module "sg" {
  source     = "./modules/sg"
  https_port = 443
  http_port  = 80
}

module "launchtemp" {
  source     = "./modules/launch_temp"
  key_name   = "cwm_key"
  i_type     = "t2.micro"
  sg_id      = module.sg.sg_id
  ami        = "ami-063d43db0594b521b"
  depends_on = [module.sg]
}

module "asg" {
  source                  = "./modules/asg"
  asg_name                = "asg"
  min                     = 1
  max                     = 1
  desired                 = 1
  launch_template_id      = module.launchtemp.launch_template_id
  launch_template_version = module.launchtemp.launch_template_version
  depends_on              = [module.launchtemp]
}