variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}
variable "s3_bucket_name" {
  #bucket name can NOT contain underscore(_)
  default     = "tfstate-s3-bucket-jirivasm"
  description = "AWS S3 bucket"
}
variable "repo_name" {
  default     = "my-repo"
  description = "AWS repository"
}