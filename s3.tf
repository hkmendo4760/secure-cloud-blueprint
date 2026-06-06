resource "aws_s3_bucket" "secure_bucket" {
  bucket = "hkmendo-secure-data-codespace" 
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.secure_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "s3_key" {
  description             = "CMK for S3 bucket encryption"
  enable_key_rotation     = true
}