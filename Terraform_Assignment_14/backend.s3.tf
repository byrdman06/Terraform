provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "bucket_tf" {
  bucket = "s3backendbucket01"
}

resource "aws_kms_key" "kms_key" {
  description = "kms key for encrypting s3 bucket"
  }

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
  bucket = aws_s3_bucket.bucket_tf.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kms_key.arn
      sse_algorithm = "aws:kms"
    }
  }
}