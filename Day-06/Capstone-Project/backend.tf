terraform {
  backend "s3" {
    bucket       = "terraweek-2026-state-bucket-changeme"
    key          = "day04/backend_demo/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}