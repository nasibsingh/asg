variable "environment" {
  type        = string
  description = "The Project Environment"
}
variable "project_name" {
  type        = string
  description = "The Project Name"
}
variable "acm_arn" {
  type        = string
  description = "ACM certificate ARN"
}
variable "domain_name" {
  type        = string
  description = "domain name"
}
variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}
