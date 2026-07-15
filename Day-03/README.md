# 🚀 TerraWeek Day #3 — Providers, Resources & Your First Cloud Infrastructure

Day 3 was where Terraform finally stopped being "just configuration files" and started provisioning real infrastructure.

After spending the first two days understanding Infrastructure as Code and learning HCL, I deployed my first AWS environment using Terraform. Along the way, I explored AWS networking fundamentals, Terraform providers, resources, data sources, dependency graphs, and meta-arguments.

---

## 📚 What I Learned

### ☁️ Terraform & AWS
- Authenticating Terraform using the AWS CLI
- AWS Provider configuration
- Provider version constraints (`~>`)

### 🏗️ Resources & Data Sources
- Creating infrastructure with Terraform Resources
- Reading existing infrastructure using Data Sources
- Why Data Sources are preferred over hardcoded values

### 🌐 AWS Networking
- VPC
- Public Subnet
- Internet Gateway
- Route Tables
- Route Table Associations
- Security Groups
- Ingress vs Egress

### 💻 Deploying Compute
- Launching an EC2 Instance
- Bootstrapping servers with `user_data`
- Deploying Nginx automatically during instance startup

### ⚙️ Terraform Workflow
- `terraform init`
- `terraform fmt`
- `terraform validate`
- `terraform plan`
- `terraform apply`
- `terraform destroy`

### 🌳 Terraform Dependency Graph
- Implicit dependencies
- Explicit dependencies using `depends_on`
- Visualizing the dependency graph with Graphviz

### 🔧 Meta-Arguments
- `count`
- `for_each`
- `depends_on`
- `lifecycle`
  - `create_before_destroy`
  - `prevent_destroy`
  - `ignore_changes`

### 🎁 Bonus Explorations
- Organizing configurations with `locals.tf`
- Provider aliases
- Generating Terraform dependency graphs

---

## 🏗️ Infrastructure Created

This project provisions:

- Custom VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- Amazon Linux 2023 EC2 Instance
- Nginx Web Server

---

## 📁 Project Structure

```text
.
├── main.tf
├── terraform.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── locals.tf
├── terraform-graph.svg
└── README.md
```

---

## 🚀 Commands Used

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## 💡 Biggest Takeaways

- Terraform doesn't execute files—it builds a dependency graph.
- Resources create infrastructure; Data Sources read existing infrastructure.
- Networking is just as important as writing Terraform.
- `user_data` makes EC2 instances self-configuring.
- Meta-arguments make Terraform configurations significantly more powerful and reusable.
- Sometimes debugging Terraform really means debugging your cloud provider.

---

## 📖 Blog

Read the complete write-up here:

**DEV.to:** [TerraWeek Day #3: Provisioning My First AWS Infrastructure with Terraform](https://dev.to/sharma291shubham/terraweek-day-3-provisioning-my-first-aws-infrastructure-with-terraform-1i2m)

---

## 🔗 Repository

This repository is part of my **#TerraWeek Challenge**, where I'm learning Terraform in public by building and documenting something new every day.

Stay tuned for **Day 4 — Terraform State** 🚀