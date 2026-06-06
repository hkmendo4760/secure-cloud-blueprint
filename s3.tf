resource "aws_s3_bucket" "secure_bucket" {
  bucket = "hkmendo-secure-data-codespace"
}

# Temporarily use default AWS managed encryption (AES256)
# This avoids the "Missing KMS Key" error while you get the backend running
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.secure_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}