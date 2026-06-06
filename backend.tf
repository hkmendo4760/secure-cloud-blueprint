terraform {
  backend "s3" {
    bucket         = "hkmendo-secure-data-codespace" # Matches the bucket above
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}