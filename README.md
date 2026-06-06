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
- **Versioning**: Enabled on all buckets to facilitate data recovery and auditability (https://www.google.com/search?q=https://avd.aquasec.com/misconfig/aws/s3/aws-0090/ compliant).
- **Audit Logging**: Implements mandatory server access logging to track all requests made to the primary data bucket.
- **nfrastructure Compliance**: The infrastructure has been scanned and verified against security standards using https://trivy.dev/, ensuring zero misconfigurations.
  
| Feature | Status |
| :--- | :--- |
| Versioning | Enabled |
| Encryption | Active |
| Public Access | Blocked |

### Infrastructure Overview
The deployment provisions the following resources:
- **aws_s3_bucket: Primary storage for application data.**
- **aws_s3_bucket: Dedicated bucket for storing server access logs.**
- **aws_kms_key: Customer Managed Key (CMK) with automatic rotation enabled.**
- **aws_s3_bucket_public_access_block: Enforced on all buckets.**
- **aws_s3_bucket_versioning: Enabled on all buckets.**
- **aws_s3_bucket_logging: Configured for primary bucket request tracking.**

## Getting Started
**Prerequistites**
- **Terraform installed**.
- **AWS CLI configured with appropriate credentials**.
- **Trivy installed for security scanning**.

**Security Scanning**
Before applying changes, ensure the configuration meets security requirements by running the Trivy scan:
```bash
trivy config s3.tf
```

### Deployment
To deploy the infrastructure, run the following commands:
```bash
terraform init
terraform plan
terraform apply
```

### Security Compliance Notes
Log Bucket Encryption: While AWS-0132 generally requires Customer Managed Keys (CMKs), we utilize AES256 for the logging destination bucket because S3 server access logging does not support SSE-KMS. This exception is explicitly suppressed in the configuration using # trivy:ignore:aws-0132 to maintain a passing security audit.

Tagging: All resources are tagged with Environment = "Production" and Security = "High" to satisfy organization-wide metadata and compliance requirements.

### Troubleshooting
If you encounter issues during terraform apply, verify your AWS credentials and ensure that the S3 bucket names defined in s3.tf are globally unique, as required by AWS.
