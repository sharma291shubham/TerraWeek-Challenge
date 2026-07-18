# 🚀 TerraWeek Challenge 2026 — Day 06

## 📖 Overview

Day 6 shifted the focus from simply provisioning infrastructure to building production-ready Terraform workflows.

In this project, I explored how professional teams manage multiple environments, validate infrastructure changes, write automated tests, perform security scans, and integrate Terraform into CI/CD pipelines.

## 🎯 What I Learned

- 🌍 Terraform Workspaces for multi-environment deployments
- 🧹 Formatting Terraform code with `terraform fmt`
- ✅ Validating configurations using `terraform validate`
- 🧪 Writing native Terraform tests with `terraform test`
- 🔒 Scanning Infrastructure as Code using Trivy
- 🤖 Automating Terraform with GitHub Actions
- 📋 Terraform production best practices

## 🛠️ Technologies Used

- Terraform
- AWS
- Terraform Workspaces
- GitHub Actions
- Trivy
- GitHub

## 📂 Repository Structure

```text
.
├── .github/
│   └── workflows/
├── tests/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── versions.tf
└── README.md
```

## ▶️ Commands Used

Initialize Terraform

```bash
terraform init
```

List workspaces

```bash
terraform workspace list
```

Create a new workspace

```bash
terraform workspace new staging
```

Switch workspace

```bash
terraform workspace select staging
```

Check active workspace

```bash
terraform workspace show
```

Format code

```bash
terraform fmt -recursive
```

Validate configuration

```bash
terraform validate
```

Run native tests

```bash
terraform test
```

Security scan

```bash
trivy config .
```

Destroy infrastructure

```bash
terraform destroy
```

## 📝 Blog

A detailed walkthrough of everything I learned during Day 6, including Workspaces, Terraform Testing, Security Scanning, GitHub Actions, and Terraform best practices:

➡️ **[Read
```