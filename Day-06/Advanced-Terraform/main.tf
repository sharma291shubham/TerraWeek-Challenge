resource "aws_s3_bucket" "workspace_demo" {
  bucket = "terraweek-${terraform.workspace}-${random_string.bucket_suffix.result}"

  tags = {
    Environment = terraform.workspace
  }
}

resource "random_string" "bucket_suffix" {
  length  = 6
  upper   = false
  special = false
}

# A tiny, credential-free config so `terraform test` runs anywhere.
# It builds a naming convention you can unit-test.

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.al2023.id
  instance_type = local.instance_type

  tags = {
    Name = random_pet.id.id
  }
}
variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "app_name" {
  description = "Application name."
  type        = string
  default     = "terraweek"
}

locals {
  # In prod we run bigger instances — demonstrates workspace/env-driven sizing.
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
  name_prefix   = "${var.app_name}-${var.environment}"
}

resource "random_pet" "id" {
  prefix = local.name_prefix
  length = 2
}

output "resource_name" {
  value = random_pet.id.id
}

output "instance_type" {
  value = local.instance_type
}