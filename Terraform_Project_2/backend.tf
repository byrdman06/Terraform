terraform {
  backend "s3" {
    bucket = "stephenatlastfstatebucket"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf_state_lock"
  }
}