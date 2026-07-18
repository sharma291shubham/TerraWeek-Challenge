provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "platform-foundation"
      ManagedBy = "Terraform"
      Owner     = "Shubham Sharma"
    }
  }
}