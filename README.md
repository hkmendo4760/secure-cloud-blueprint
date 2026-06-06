# Secure Cloud Blueprint: S3 Infrastructure

This repository contains the Terraform configuration for deploying a secure, production-ready Amazon S3 bucket architecture.

## Table of Contents
1. [Features](#features)
2. [Infrastructure Overview](#infrastructure-overview)
3. [Getting Started](#getting-started)
4. [Security Compliance Notes](#security-compliance-notes)

## Features
- **Public Access Protection**: Explicitly blocks all public access to both primary and logging buckets.
- **Encryption at Rest**:
  - **Primary Data Bucket**: Uses a customer-managed KMS key.
  - **Logging Bucket**: Uses `AES256` (standard for logging).

## Getting Started
### Deployment
```bash
terraform init
terraform plan
terraform apply
