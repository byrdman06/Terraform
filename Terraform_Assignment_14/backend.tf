terraform {
  backend "s3" {
    bucket = "s3backendbucket01"
    key = "Terraform/terraform.tfstate"
    region = "us-east-1"
  }
}