# 1. Enable Versioning (Fixes AWS-0090)
resource "aws_s3_bucket_versioning" "secure_bucket" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 2. Block Public Access (Fixes AWS-0086, AWS-0087, AWS-0091, AWS-0093, AWS-0094)
resource "aws_s3_bucket_public_access_block" "secure_bucket" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 3. Use Customer Managed Key for Encryption (Fixes AWS-0132)
resource "aws_kms_key" "mykey" {
  description             = "CMK for S3 bucket encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# 4. Enable Logging (Fixes AWS-0089)
# Note: Requires a separate bucket for logs, or you can create one in this file.
resource "aws_s3_bucket" "log_bucket" {
  bucket = "hkmendo-secure-data-codespace-logs"
}

resource "aws_s3_bucket_logging" "secure_bucket" {
  bucket = aws_s3_bucket.secure_bucket.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}