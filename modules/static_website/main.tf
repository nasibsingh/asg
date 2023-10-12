#S3-----

resource "aws_s3_bucket" "web_panel" {
  bucket        = "${var.project_name}-${var.bucket_name}-${var.environment}"
  force_destroy = true
  tags = {
    Name = "${var.project_name}-${var.bucket_name}-${var.environment}"
    Env  = "${var.environment}"
  }
}

#S3 Bucket Ownership
resource "aws_s3_bucket_ownership_controls" "web_panel" {
  bucket = aws_s3_bucket.web_panel.id

  rule {
    object_ownership = local.object_ownership
  }
}

#Block-Public-Access
resource "aws_s3_bucket_public_access_block" "web_panel" {
  bucket = aws_s3_bucket.web_panel.id

  block_public_acls       = local.block_public_acls
  block_public_policy     = local.block_public_policy
  ignore_public_acls      = local.ignore_public_acls
  restrict_public_buckets = local.restrict_public_buckets
}

#Bucket ACL
resource "aws_s3_bucket_acl" "web_panel" {
  bucket = aws_s3_bucket.web_panel.id

  acl = local.acl

  lifecycle {
    prevent_destroy = false
  }
}


#Versioning
resource "aws_s3_bucket_versioning" "web_panel" {
  bucket = aws_s3_bucket.web_panel.id

  versioning_configuration {
    status = local.status
  }
}
#Website-configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.web_panel.id

  index_document {
    suffix = local.suffix
  }

  error_document {
    key = local.key
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.web_panel.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}


#Cloudfront-----

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "${var.project_name}-${var.bucket_name}-${var.environment}-OAI"
}

resource "aws_cloudfront_distribution" "web_panel_cf" {
  enabled = local.enabled

  origin {
    domain_name = aws_s3_bucket.web_panel.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.web_panel.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods        = local.allowed_methods
    cached_methods         = local.cached_methods
    compress               = local.compress
    target_origin_id       = aws_s3_bucket.web_panel.id
    viewer_protocol_policy = local.viewer_protocol_policy
    cache_policy_id        = data.aws_cloudfront_cache_policy.CachingDisabled.id
  }
  custom_error_response {
    error_code         = local.error_code_1
    response_code      = local.response_code_1
    response_page_path = local.response_page_path_1
  }
  custom_error_response {
    error_code         = local.error_code_2
    response_code      = local.response_code_2
    response_page_path = local.response_page_path_2
  }

  price_class = local.price_class
  #aliases     = [var.domain_name]

  restrictions {
    geo_restriction {
      restriction_type = local.restriction_type
    }
  }

  comment = "${var.project_name}-${var.bucket_name}-${var.environment}"

  tags = {
    name        = "${var.project_name}-${var.bucket_name}-${var.environment}"
    environment = var.environment
  }

  viewer_certificate {
    # acm_certificate_arn      = var.acm_arn
    minimum_protocol_version = local.minimum_protocol_version
    ssl_support_method       = local.ssl_support_method

    cloudfront_default_certificate = true

  }
}
