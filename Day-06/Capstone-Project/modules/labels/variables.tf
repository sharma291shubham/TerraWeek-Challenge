variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "component" {
  description = "Infrastructure component"
  type        = string
}

variable "extra_tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}