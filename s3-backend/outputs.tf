output "s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
  description = "ARN of S3 bucket"
}

