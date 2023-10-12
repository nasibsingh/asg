output "project_name" {
  value = var.project_name
}

output "environment" {
  value = var.environment
}

output "bucket_name" {
  value = var.bucket_name_4
}

output "web_panel_bucket" {
  value = aws_s3_bucket.document_upload.id
}
