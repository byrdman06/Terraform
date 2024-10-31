resource "aws_kms_key" "terraform_state_key" {
  description = "kms key for encrypting terraform"

  tags = {
    Name = "TerraformStateKey"
  }
}

terraform {
  backend "s3" {
    bucket     = "terraform_bucket"
    key        = "~/ec2-user/Atlas/Terraform/terraform.tfstate"
    region     = "us-east-1"
    encrypt    = true
  }
}