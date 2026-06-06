resource "aws_iam_role" "existing_role" {
  name = "terraform-s3-deployer-role"

  # This matches the Trust Relationship you showed me
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::811352020564:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
              "repo:hkmendo4760/secure-cloud-blueprint:*"
            ]
          }
        }
      }
    ]
  })
}
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
resource "aws_iam_role_policy_attachment" "attach_to_existing_role" {
  role       = "terraform-s3-deployer-role" # Ensure this matches your manual role name exactly
  policy_arn = aws_iam_policy.s3_deployment_policy.arn
}