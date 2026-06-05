# secure-cloud-blueprint
Demonstrating 'Shift Left' security practices using Terraform and automated Trivy vulnerability scanning in GitHub Actions.


Legend
💲 - Commercial/paid product or service
🆓 - Free tier available (for commercial products)
🏛️ - Government/public sector focused
Policy Engines
General-purpose policy engines used to evaluate Terraform plans and configurations against compliance rules.

Open Policy Agent (OPA) - General-purpose policy engine using Rego language, CNCF graduated project with extensive Terraform integration via Conftest and terraform-plan evaluation.
HashiCorp Sentinel - Policy-as-code framework embedded in Terraform Cloud/Enterprise for enforcing compliance rules on runs. 💲
Cloud Custodian - Rules engine for cloud resource management with Terraform plan evaluation and runtime policy enforcement. CNCF incubating project.
IaC Security Scanners
Tools that analyze Terraform code, plans, or state for security misconfigurations and compliance violations.

Multi-Framework Scanners
Scanners that support multiple IaC frameworks including Terraform.

Checkov - Static analysis tool with 1,000+ built-in policies covering CIS, SOC 2, HIPAA, PCI DSS, and NIST benchmarks for Terraform, CloudFormation, Kubernetes, and more.
Trivy - Security scanner for IaC misconfigurations, vulnerabilities, secrets, and licenses with Terraform HCL and plan support (absorbed tfsec).
KICS - Open-source scanner by Checkmarx with 1,900+ queries across Terraform, Ansible, Docker, and Kubernetes.
Snyk IaC - IaC security testing integrated with the Snyk developer security platform. 💲 🆓
SonarQube IaC Analysis - SonarSource's IaC static analyzer covering Terraform, CloudFormation, Kubernetes, and Docker with security and quality rules.
Drogon - High-performance open-source scanner combining SAST, SCA, secret detection, and IaC analysis for Terraform and other formats, built for CI/CD pipelines.
Terraform-Specific Scanners
Scanners focused specifically on Terraform or OpenTofu.

terraform-compliance - BDD-style testing framework for Terraform using Cucumber syntax to write compliance tests in natural language.
tflint - Pluggable Terraform linter with AWS, Azure, and GCP rulesets for detecting errors and enforcing best practices.
CloudFormation Guard (cfn-guard) - Policy-as-code DSL from AWS for writing rules that validate JSON and YAML data, including Terraform plan JSON and HCL configurations.
Tirith - Policy framework for Terraform stacks that evaluates infrastructure configurations against compliance policies defined in JSON.
pike - Scans Terraform and OpenTofu code to calculate the minimum IAM permissions required for deployment across AWS, GCP, and Azure.
Terraform Testing
Tools for writing automated tests that verify Terraform modules meet compliance and correctness requirements.

Terratest - Go library for writing integration tests for Terraform modules, deploying real infrastructure and running assertions against it.
Terraform test - Built-in Terraform 1.6+ testing command for writing unit and integration tests in .tftest.hcl files without external dependencies.
Intentionally Vulnerable Terraform
Repositories with deliberately misconfigured Terraform for testing and benchmarking security scanners.

TerraGoat - Bridgecrew's "vulnerable by design" Terraform repository covering common misconfigurations across AWS, Azure, and GCP.
sadcloud - NCC Group's tool for spinning up intentionally misconfigured AWS infrastructure via Terraform to test detection coverage.
Compliance-Ready Modules
Pre-configured Terraform modules designed with compliance controls built in.

AWS
Compliance.tf - Compliance-ready Terraform modules wrapping terraform-aws-modules with enforced compliance controls and audit evidence generation for SOC 2, HIPAA, PCI DSS, NIS2, DORA, and ISO 27001. 💲 🆓
opsZero - Compliance automation platform providing Terraform modules for AWS infrastructure meeting HIPAA, PCI DSS, FedRAMP, StateRamp, and CMMC requirements. 💲
terraform-aws-secure-baseline - Terraform module to configure an AWS account with the secure baseline recommended by CIS Amazon Web Services Foundations Benchmark and AWS Foundational Security Best Practices.
Azure
Azure CAF Terraform - Cloud Adoption Framework landing zone modules with built-in governance and compliance patterns.
GCP
Google Cloud Foundation Toolkit - Google-maintained Terraform blueprints for secure GCP deployments with organizational policy compliance.
Secure Cloud Foundation - Protected B/Medium/Medium GCP landing zone with Canadian government compliance patterns. 🏛️
GCP Hardening Toolkit (GHT) - Google-maintained Terraform modules and blueprints for incrementally hardening brownfield GCP environments, with custom IAM role generation and organization policy constraints.
Cloud Provider Compliance Tools
Cloud-native services that complement Terraform-managed infrastructure compliance.

AWS
AWS Config Rules - Managed and custom rules evaluating AWS resource configurations against compliance baselines, deployable via Terraform.
AWS Security Hub - Aggregated security and compliance findings across AWS accounts with CIS, PCI DSS, and NIST benchmarks.
AWS Control Tower - Managed landing zone service with SCPs and Config rules as guardrails for multi-account AWS environments, configurable via Terraform.
AWS Service Control Policies - Preventive governance policies at the AWS Organizations level, deployable via Terraform to enforce compliance boundaries across all accounts.
AWS Control Tower Controls with Terraform - Official AWS sample showing how to implement and administer preventive, detective, and proactive Control Tower guardrails via Terraform IaC.
deny.cloud - Web-based builder for AWS Service Control Policies and Resource Control Policies with 150 pre-built templates mapped to CIS, PCI DSS, SOC 2, and HIPAA, exporting ready-to-apply Terraform HCL.
terraform-iam-policy-validator - AWS CLI tool that validates IAM policies in Terraform plan JSON against best practices using IAM Access Analyzer checks.
Azure
Azure Policy - Policy enforcement service for Azure resources with built-in compliance definitions deployable via Terraform.
Microsoft Defender for Cloud - Cloud security posture management configurable via Terraform (azurerm_security_center_* resources) with regulatory compliance dashboards for CIS, PCI DSS, ISO 27001, and SOC 2. 💲
GCP
GCP Organization Policy - Centralized policy constraints for GCP organizations manageable via Terraform.
Security Command Center - GCP security findings and compliance monitoring platform, with notification configs and source management via google_scc_* Terraform resources. 💲
Multi-Cloud
Prowler - Open-source security assessment tool for AWS, Azure, GCP, and Kubernetes covering CIS, PCI, HIPAA, SOC 2, ISO 27001, and more.
Steampipe - SQL query engine for live cloud resource data across AWS, Azure, and GCP via plugins. Used as the data layer for Powerpipe compliance benchmarks.
Powerpipe - Benchmark and dashboard runner for compliance controls, using Steampipe as its data source. Runs CIS, SOC 2, HIPAA, PCI, NIST, and FedRAMP benchmarks across AWS, Azure, and GCP.
CloudQuery - Open-source cloud asset inventory tool that syncs AWS, Azure, and GCP resources into SQL or Parquet for compliance queries and reporting.
Compliance Frameworks and Standards
Resources mapping compliance framework requirements to Terraform infrastructure controls.

CIS Benchmarks
CIS AWS Foundations Benchmark - Center for Internet Security benchmark for AWS with Terraform-implementable controls.
CIS Azure Foundations Benchmark - CIS benchmark for Azure covering identity, networking, logging, and monitoring controls.
CIS GCP Foundations Benchmark - CIS benchmark for Google Cloud Platform deployments.
SOC 2
SOC 2 Compliance Mapping for Terraform - Mapping of SOC 2 Trust Services Criteria to Terraform resource configurations and controls. 💲
PCI DSS
PCI DSS v4.0 on AWS - AWS Security Hub PCI DSS v4.0 controls with Terraform-provisionable remediation.
NIST and FedRAMP
NIST SP 800-53 Controls - Security and privacy control catalog (1,000+ controls) used as the baseline for FedRAMP, FISMA, and CMMC. Controls map to cloud resource configurations but the document itself is framework-only, not Terraform-specific. 🏛️
OSCAL (Open Security Controls Assessment Language) - Machine-readable compliance format by NIST for expressing security control implementations. 🏛️
FedRAMP Authorization Boundary Guidance - FedRAMP guidance on defining cloud system boundaries, directly relevant to scoping Terraform-managed infrastructure for federal authorization. 🏛️
Evidence and Audit
Tools for generating, managing, and formatting compliance evidence from Terraform-managed infrastructure.

OSCAL Tooling
Compliance Trestle - SDK and CLI for creating and validating OSCAL documents, part of the OSCAL Compass project.
Lula - Tool for mapping OSCAL component definitions to live infrastructure for continuous compliance validation. 🏛️
GovReady-Q - Compliance-as-code platform for generating System Security Plans with OSCAL output. 🏛️
Evidence Generation
Drata - Compliance automation platform with infrastructure evidence collection including Terraform state integration. 💲
RegScale - Continuous compliance automation platform with OSCAL-native evidence management. 💲
Yor - Automated IaC tagging tool that applies Git metadata, trace identifiers, and custom tags to Terraform resources for audit trail and ownership tracking.
mapotf - Meta-programming tool for Terraform that matches and transforms HCL blocks, letting module authors inject governance patterns such as ignore_changes rules and private-endpoint wrappers across existing modules.
Drift Detection
Digger - Open-source Terraform CI/CD with drift detection capabilities.
cloud-concierge - Open-source tool that surfaces infrastructure drift, security findings, and cost estimates as pull requests against your Terraform codebase.
DriftHound - Receives Terraform drift reports via API and provides a web dashboard with historical tracking, analytics, and Slack notifications.
atlantis-drift-detection - Runs Atlantis-driven terraform plan across every project in an atlantis.yaml monorepo, reports drift and untracked workspaces to Slack, and optionally triggers remediation workflows.
tfe-drift - Automates drift-detection plans across Terraform Cloud and Terraform Enterprise workspaces with rate limiting, Prometheus metrics, and a ready-to-use GitHub Action.
Policy Libraries and Rulesets
Reusable policy collections for enforcing compliance rules on Terraform code.

OPA/Rego Libraries
Conftest - Utility for writing tests against structured configuration data using OPA/Rego, widely used for Terraform plan validation.
Regal - Linter for Rego policies with 50+ built-in rules covering correctness, style, and performance. Catches bugs and anti-patterns before policies reach production.
tflint-ruleset-opa - TFLint plugin for writing custom compliance rules in Rego, bridging tflint's Terraform-native linting with OPA policy evaluation.
Prancer Compliance Test - Rego policy library with a dedicated terraform/ ruleset for IaC scanning alongside AWS, Azure, GCP, and Kubernetes policies, designed for OPA and the Prancer platform. 💲 🆓
Sentinel Libraries
terraform-sentinel-policies - Example Sentinel policies for Terraform Cloud/Enterprise demonstrating common compliance patterns.
Guard Rule Libraries
Rule libraries for CloudFormation Guard, which evaluates Terraform plan JSON.

AWS Guard Rules Registry - Official AWS registry of Guard rules covering CIS, NIST, PCI DSS, HIPAA, and SOC 2 compliance frameworks, applicable to Terraform plan JSON via cfn-guard.
Terraform Automation Platforms
Remote execution platforms for Terraform and OpenTofu with policy enforcement built into the run lifecycle. Unlike the CI/CD integrations below, these replace or wrap your pipeline entirely.

HCP Terraform and Terraform Enterprise - HashiCorp's Terraform execution platform with native Sentinel and OPA policy enforcement on runs, audit logging, and team access controls, available as cloud-hosted (HCP Terraform) or self-hosted (Terraform Enterprise). 💲 🆓
Spacelift - Terraform and OpenTofu automation platform with built-in OPA policy evaluation on plans, drift detection, and custom policy frameworks. 💲 🆓
env0 - Terraform and OpenTofu automation platform with OPA and Checkov policy integration, cost governance, and environment lifecycle management. 💲 🆓
Scalr - Terraform automation platform with OPA policy enforcement and hierarchical policy inheritance across organizations, accounts, and environments. 💲 🆓
Terrateam - GitOps-based Terraform and OpenTofu automation via GitHub and GitLab pull requests, with OPA policy enforcement, drift detection, and access controls. 💲 🆓
StackGuardian - Terraform and OpenTofu automation platform with OPA and Checkov policy enforcement built into every run, drift detection, and role-based access controls across environments. 💲 🆓
OTF - Open-source alternative to Terraform Enterprise with SSO, team management, and agent support, no per-resource pricing.
Terrakube - Open-source Terraform automation platform with custom workflow definitions, identity provider integration via DEX, and pluggable compliance tool hooks.
Terrapod - Open-source, self-hosted Terraform and OpenTofu automation platform with governance controls, drift detection, RBAC, and HCP Terraform API compatibility.
ops0 - Governance-first Terraform and OpenTofu platform with OPA and Checkov policy enforcement, drift detection, and compliance mapping to 27+ frameworks including SOC 2, HIPAA, PCI DSS, and CIS. 💲 🆓
Terramate - Open-source IaC orchestration and code generation engine for Terraform, OpenTofu, and Terragrunt stacks with change detection, policy hooks, and graph-based run ordering. Optional Terramate Cloud adds drift detection, observability, and misconfiguration reporting. 💲 🆓
CI/CD and Platform Integration
Tools and patterns for integrating Terraform compliance checks into deployment pipelines.

Terraform Cloud Run Tasks - Integration point for adding compliance checks to Terraform Cloud/Enterprise runs.
Atlantis - Self-hosted Terraform pull request automation with pre-apply policy check hooks.
Pre-commit Terraform - Collection of Git pre-commit hooks for Terraform including linting, validation, and security scanning.
grept - Extensible repository linter with HCL-defined rules and a plan/apply workflow, used by Azure Verified Modules to enforce license, file-structure, and content standards across Terraform module repos.
trunk.io - Developer tooling platform with Terraform linter orchestration including Checkov, tflint, and Trivy. 💲 🆓
Cloud Security Plugin - JetBrains IDE plugin (IntelliJ, PyCharm, etc.) for IaC security scanning including Terraform, enabling shift-left detection in the editor.
Terraform Risk Assessor - GitHub Action that analyses Terraform plan JSON and comments risk levels on pull requests.
Learning Resources
Articles
Policy as Code on AWS - AWS practical guide to implementing policy-as-code in infrastructure workflows.
Terraform Best Practices - Community-maintained guide to Terraform conventions and patterns including some security and compliance considerations. Translated into 20+ languages.
A Deep Dive into Terraform Static Code Analysis Tools - Side-by-side comparison of Terraform security scanning tools with feature matrices.
Shifting Cloud Security Left: Scanning Infrastructure as Code for Security Issues - Christophe Tafani-Dereeper's guide to integrating IaC security scanners into development workflows, covering tfsec, Checkov, and Terrascan.
Run Security Scans on Terraform and OpenTofu with Trivy and GitHub Actions - Step-by-step guide to automating Trivy misconfiguration scanning for Terraform and OpenTofu projects in GitHub Actions pipelines.
Compliant Secrets with Terraform - Patterns for managing secrets in Terraform without exposing sensitive values in state files, covering AWS Secrets Manager and compliant credential handling.
ISO 27001 on AWS with Terraform - Practical implementation of ISO 27001 controls on AWS infrastructure provisioned with Terraform, with control-to-resource mappings.
Conference Talks
Securely Deploying Infrastructure as Code - Chris Ayers at NDC Security 2023 walks through integrating Terraform security scanning tools including Checkov, tfsec, and secret detection into CI/CD pipelines.
Supply Chain Attacks in the Terraform Registry - Kyle Kotowick at NDC Security 2025 demonstrates typosquatting and malicious module attack vectors targeting the public Terraform Registry.
Managing Policy as Code With Terraform and Sentinel - HashiCorp deep dive into enforcing compliance guardrails on Terraform Cloud runs using Sentinel policies and the Foundational Policies Library.
Policy as Code: IT Governance With HashiCorp Sentinel - Chris Marchesi at HashiConf 2019 introduces Sentinel as a policy-as-code framework for Terraform, Vault, Consul, and Nomad enterprise governance.
Open Policy Agent (OPA) Intro and Deep Dive - Anders Eknert (Styra) and Xander Grzywinski (Microsoft) at KubeCon NA 2024 cover OPA fundamentals including Terraform plan validation via Conftest with production examples.
Books
Terraform: Up & Running - Yevgeniy Brikman's Terraform guide covering modules, testing, production patterns, and team workflows.
Infrastructure as Code - Kief Morris' guide to managing infrastructure with automation covering compliance and governance patterns.
The Dao of Terraform Modules - Free online book on Terraform module design, governance, and toolchain, by a core Azure Verified Modules developer, covering Checkov, Conftest, Trivy, grept, mapotf, tflint, and yor.
Courses
Styra Academy - Free courses on OPA, Rego, and policy-as-code for infrastructure and application authorization.
HashiCorp Sentinel Training - Official tutorials for writing Sentinel policies in Terraform Cloud/Enterprise.
Newsletters
weekly.tf - Weekly newsletter covering Terraform, OpenTofu, and infrastructure-as-code ecosystem news.
tl;dr sec - Weekly newsletter covering security tooling, policy, and compliance engineering.
CloudSecList - Curated cloud security newsletter covering IaC security, CSPM, and compliance tools.
Related Awesome Lists
awesome-tf - Curated Terraform and OpenTofu resources.
awesome-cloud-security - Cloud security resources across AWS, Azure, and GCP.
awesome-devsecops - DevSecOps tools and resources including IaC security.
awesome-opa - Open Policy Agent tools, frameworks, and articles.
awesome-oscal - OSCAL ecosystem tools and resources.
Contributing
