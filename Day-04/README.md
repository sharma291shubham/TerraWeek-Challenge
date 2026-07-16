# 🚀 TerraWeek Day #4 — Terraform State Management, Imports & Resource Lifecycle

Day 4 focused on understanding how Terraform manages infrastructure after it has been created.

After provisioning infrastructure in Day 3, I explored what happens behind the scenes when Terraform needs to remember resources, manage existing infrastructure, and handle changes over time.

This day was all about Terraform state management, importing existing resources, and understanding how Terraform tracks the lifecycle of infrastructure.

---

## 🎯 Objectives

- Understand Terraform state and remote backends
- Configure AWS S3 as a remote state backend
- Explore state locking
- Understand state refresh and drift detection
- Import existing AWS resources into Terraform
- Generate Terraform configuration from imported resources
- Explore `moved` and `removed` blocks
- Validate infrastructure using `check` blocks

---

## 🗄️ Terraform State Management

Terraform uses a state file to keep track of the infrastructure it manages.

I explored:

- Local vs remote state
- Storing Terraform state in AWS S3
- State locking using S3 lock files
- How Terraform refreshes state before planning changes

One important concept I learned:

> Terraform state is not the source of truth. The real infrastructure is.

Terraform uses the state file as its memory, but during `terraform plan` and `terraform apply`, it compares:

- Desired state (`.tf` files)
- Terraform state (`terraform.tfstate`)
- Actual infrastructure (AWS)

This is how Terraform detects state drift.

---

## 📥 Importing Existing Infrastructure

Terraform can manage resources that were not originally created through Terraform.

For this exercise, I:

- Created an S3 bucket manually in AWS
- Imported it into Terraform using:

```bash
terraform import aws_s3_bucket.imported <bucket-name>
```

This helped me understand that importing:

- Adds the resource to Terraform state
- Does not automatically create Terraform configuration

---

## 🔀 Managing Resource Lifecycle

I explored Terraform features that help safely manage changes.

### `moved` Blocks

Used for renaming resources without destroying and recreating them.

Example:

```hcl
moved {
  from = random_pet.demo[0]
  to   = random_pet.terraform_pet0
}
```

### `removed` Blocks

Used to remove resources from Terraform management without destroying the actual infrastructure.

Example:

```hcl
removed {
  from = random_pet.terraform_pet1

  lifecycle {
    destroy = false
  }
}
```

---

## ✅ Terraform Check Blocks

Terraform `check` blocks allow adding custom validations.

Example:

```hcl
check "bucket_exists" {
  assert {
    condition     = data.aws_s3_bucket.imported.bucket == "terraweek-day4-import"
    error_message = "Imported bucket could not be found."
  }
}
```

I tested successful and failed validations to understand how Terraform reports warnings.

---

## 🧪 Hands-on Tasks Completed

✅ Configured AWS S3 backend for Terraform state  
✅ Enabled remote state locking  
✅ Imported an existing S3 bucket into Terraform  
✅ Explored state refresh and drift detection  
✅ Renamed resources using `moved` blocks  
✅ Removed resources from Terraform management using `removed` blocks  
✅ Added infrastructure validation using `check` blocks  

---

## 🎯 Key Learnings

- Terraform state is Terraform's memory, not the source of truth.
- Terraform refreshes state by communicating with the cloud provider before planning changes.
- Remote state enables collaboration and safer infrastructure management.
- Importing brings existing infrastructure under Terraform management but does not generate configuration automatically.
- `moved` blocks allow safe resource renaming without recreation.
- `removed` blocks allow removing Terraform ownership without destroying infrastructure.
- `check` blocks add validation and help catch unexpected infrastructure issues.

---

## 📖 Detailed Walkthrough

For the complete hands-on walkthrough, screenshots, commands, and deeper explanations:

👉 Read the full blog here:  
[TerraWeek Day #4: Understanding Terraform State & Remote Backends](https://dev.to/sharma291shubham/terraweek-day-4-understanding-terraform-state-remote-backends-22ig/)

## 🔗 Repository

This repository is part of my **#TerraWeek Challenge**, where I'm learning Terraform in public by building and documenting something new every day.

Stay tuned for **Day 5 — Modules** 🚀