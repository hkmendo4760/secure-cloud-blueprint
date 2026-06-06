# 1. Define the Policy
resource "aws_iam_policy" "s3_deployment_policy" {
  name        = "S3DeploymentPolicy"
  description = "Allows creation of encrypted S3 buckets and KMS keys"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:CreateBucket",
          "s3:PutEncryptionConfiguration",
          "s3:PutBucketPublicAccessBlock",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "kms:CreateKey",
          "kms:DescribeKey",
          "kms:EnableKeyRotation",
          "kms:PutKeyPolicy"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# 2. Attach it to your existing role
resource "aws_iam_role_policy_attachment" "attach_to_existing_role" {
  role       = "terraform-s3-deployer-role" # Ensure this matches your manual role name exactly
  policy_arn = aws_iam_policy.s3_deployment_policy.arn
}