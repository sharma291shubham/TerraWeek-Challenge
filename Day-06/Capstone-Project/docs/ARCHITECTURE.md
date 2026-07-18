# 🏗️ Architecture Notes

## Overview

This project is a **Terraform Platform Foundation** built as the capstone for the TerraWeek Challenge 2026.

Rather than focusing on deploying a single AWS resource, the objective was to build a reusable, modular Terraform codebase that reflects common Infrastructure as Code practices used by DevOps and Platform Engineering teams.

The architecture emphasizes:

- Reusability
- Modularity
- Separation of concerns
- Infrastructure testing
- Security validation
- Automated quality checks

---

# Architecture

```
                   Root Module
                        │
      ┌─────────────────┼─────────────────┐
      │                 │                 │
      ▼                 ▼                 ▼
 Labels Module     Network Module    Storage Module
      │                 │                 │
      │                 │                 ▼
      │                 │            Amazon S3 Bucket
      │                 │
      │                 ▼
      │        AWS VPC Registry Module
      │
      ▼
 Common Tags
 Naming Convention

```

---

# Module Design

## Root Module

The root module acts as the orchestration layer.

Responsibilities:

- Configure providers
- Configure backend
- Pass variables
- Instantiate child modules
- Export outputs

The root module intentionally contains very little infrastructure logic.

---

## Labels Module

Purpose:

Provide consistent naming and tagging across all infrastructure.

Outputs include:

- Resource name prefixes
- Common tags
- Environment metadata

Centralizing naming avoids duplicated tag definitions throughout the project.

---

## Network Module

Purpose:

Provision networking resources using the official Terraform Registry VPC module.

Resources include:

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

Using the Registry module reduces custom networking code while following community best practices.

---

## Storage Module

Purpose:

Provision shared platform storage.

Currently creates:

- Amazon S3 Bucket

The bucket is isolated inside its own module so additional storage resources can be added later without changing the root module.

---

# Design Decisions

## Why Modules?

Infrastructure naturally grows over time.

Separating networking, storage, and shared configuration into modules makes the code:

- Easier to maintain
- Easier to reuse
- Easier to test
- Easier to extend

---

## Why an Official Registry Module?

Instead of writing an entire VPC module manually, this project uses the official AWS VPC Registry Module.

Benefits:

- Community maintained
- Well tested
- Production proven
- Less custom code to maintain

---

## Why a Custom Labels Module?

Even though tagging is simple today, centralized naming becomes increasingly valuable as infrastructure grows.

It also encourages consistent tagging across environments.

---

# Environment Strategy

This project was built to support multiple environments.

Current implementation:

- Development
- Staging

Terraform Workspaces were explored during TerraWeek to understand state isolation between environments.

For larger production infrastructures, separate backends and deployment pipelines would generally provide stronger isolation.

---

# Infrastructure Quality

The project follows multiple quality gates before deployment.

```
Terraform Code
      │
      ▼
terraform fmt
      │
      ▼
terraform validate
      │
      ▼
terraform test
      │
      ▼
TFLint
      │
      ▼
Trivy Security Scan
      │
      ▼
GitHub Actions
```

This layered validation helps detect formatting issues, configuration errors, security findings, and infrastructure regressions before deployment.

---

# Security Considerations

The project avoids common Infrastructure as Code pitfalls by:

- Pinning Terraform versions
- Pinning provider versions
- Avoiding hard-coded credentials
- Using GitHub Secrets for CI authentication
- Keeping Terraform state out of Git
- Running Trivy security scans
- Running TFLint validation

---

# CI/CD Workflow

Every Pull Request automatically performs:

1. Terraform Format Check
2. Terraform Initialization
3. Terraform Validation
4. Terraform Plan

This ensures infrastructure changes are validated before merging.

---

# Future Improvements

This repository intentionally represents a foundation rather than a finished platform.

Future iterations may include:

- Amazon EKS
- ArgoCD
- GitOps
- Kubernetes workloads
- HCP Terraform remote workspaces
- Additional reusable modules
- Monitoring and observability
- Policy as Code
- Internal Developer Platform concepts

---

# Key Takeaways

This project demonstrates how Terraform can be organized using modern Infrastructure as Code practices rather than focusing solely on provisioning cloud resources.

The emphasis is on building infrastructure that is:

- Modular
- Reusable
- Testable
- Secure
- Maintainable
- Ready to evolve as the platform grows.