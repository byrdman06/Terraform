terraform {
  backend "s3" {
    bucket         = "atlasbucket0001"
    key            = "statefiles/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb"
  }
}