resource "random_string" "bucket_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "platform_storage" {

  bucket = "${var.project_name}-${var.environment}-${random_string.bucket_suffix.result}"

  tags = var.tags

}