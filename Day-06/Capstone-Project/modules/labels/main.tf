locals {

  name = "${var.project}-${var.environment}-${var.component}"

  tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      Component   = var.component
      ManagedBy   = "Terraform"
    },
    var.extra_tags
  )

}