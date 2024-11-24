provider "aws" {
  region                   = "us-east-1"
  profile                  = "root"
  shared_credentials_files = ["~/.aws/credentials"]
}