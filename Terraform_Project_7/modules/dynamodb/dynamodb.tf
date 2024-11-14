resource "aws_dynamodb_table" "tf_dynamodb" {
  name     = var.dynamodb
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}