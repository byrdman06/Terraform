resource "aws_s3_bucket" "remote_bucket" {
  bucket = "atlasbucket0000006"
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = "atlasbucket0000006"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state_lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}

terraform {
  backend "s3" {
    bucket = "atlasbucket0000006"
    key = "statefile/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}