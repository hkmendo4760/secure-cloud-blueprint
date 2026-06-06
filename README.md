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
- **Versioning**: Enabled on all buckets to facilitate data recovery and auditability (AWS-0090 compliant).
- **Audit Logging**: Implements mandatory server access logging to track all requests made to the primary data bucket.
- **Versioning**: Enabled on all buckets to facilitate data recovery and auditability (AWS-0090 compliant).

| Feature | Status |
| :--- | :--- |
| Versioning | Enabled |
| Encryption | Active |
| Public Access | Blocked |

## Getting Started
### Deployment
```bash
terraform init
terraform plan
terraform apply
