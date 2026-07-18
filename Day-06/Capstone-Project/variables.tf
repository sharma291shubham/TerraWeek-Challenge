variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment Environment"
  type        = string
  default     = "dev"
  validation {
    condition = contains(
      ["dev", "staging", "prod"],
      var.environment
    )
    error_message = "Environment must be dev, staging or prod."
  }
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "platform-foundation"
}