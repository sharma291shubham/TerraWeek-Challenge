data "aws_s3_bucket" "imported" {
  bucket = aws_s3_bucket.imported.id
}

check "bucket_exists" {
  assert {
    condition     = data.aws_s3_bucket.imported.bucket == "terraweek-day4-import"
    error_message = "Imported bucket could not be found."
  }
}