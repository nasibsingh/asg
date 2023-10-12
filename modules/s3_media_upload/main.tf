resource "aws_s3_bucket" "document_upload" {
  bucket        = "${var.project_name}-${var.bucket_name_4}-${var.environment}"
  force_destroy = true
  tags = {
    Name = "${var.project_name}-${var.bucket_name_4}-${var.environment}"
    Env  = "${var.environment}"
  }
}

#S3 Bucket Ownership
resource "aws_s3_bucket_ownership_controls" "document_upload" {
  bucket = aws_s3_bucket.document_upload.id

  rule {
    object_ownership = local.object_ownership
  }
}

#Block-Public-Access
resource "aws_s3_bucket_public_access_block" "document_upload" {
  bucket = aws_s3_bucket.document_upload.id

  block_public_acls       = local.block_public_acls
  block_public_policy     = local.block_public_policy
  ignore_public_acls      = local.ignore_public_acls
  restrict_public_buckets = local.restrict_public_buckets
}

#Bucket ACL
resource "aws_s3_bucket_acl" "document_upload" {
  bucket = aws_s3_bucket.document_upload.id

  acl = local.acl

  lifecycle {
    prevent_destroy = false
  }
}


#Versioning
resource "aws_s3_bucket_versioning" "document_upload" {
  bucket = aws_s3_bucket.document_upload.id

  versioning_configuration {
    status = local.status
  }
}
