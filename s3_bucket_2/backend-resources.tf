resource "aws_s3_bucket" "tf_s3bucket" {
  bucket = "stephenatlastfstatebucket"
}

resource "aws_s3_bucket_versioning" "tf_s3bucket_version" {
  bucket = aws_s3_bucket.tf_s3bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_s3bucket_encrypt" {
  bucket = aws_s3_bucket.tf_s3bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.tf_bucket_key.key_id
    }
  }
  depends_on = [aws_kms_key.tf_bucket_key]
}

resource "aws_kms_key" "tf_bucket_key" {
  description = "KMS key S3 Bucket"
}

resource "aws_dynamodb_table" "tf_dynamodb" {
  name     = "tf_state_lock"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}