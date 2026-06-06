terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"

  # 1. Force the provider to skip the EC2 Metadata API (which doesn't exist in Codespaces)
  skip_metadata_api_check = true
  
  # 2. Force the provider to skip searching for local credential files
  shared_credentials_files = []
  shared_config_files      = []

  # 3. Use the OIDC role assumption
  assume_role {
    role_arn     = "arn:aws:iam::811352020564:role/terraform-s3-deployer-role"
    session_name = "TerraformS3Deployment"
  }
}