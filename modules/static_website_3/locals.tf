locals {


  ###S3 Bucket Ownership
  object_ownership = "BucketOwnerPreferred"

  #Bloack Public Access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  #S3 Bucket ACL
  acl = "private"

  #Versioning
  status = "Disabled"

  #Website-configuration
  suffix = "index.html"
  key    = "index.html"

  ###CLOUDFRONT

  enabled                = true
  allowed_methods        = ["GET", "HEAD"]
  cached_methods         = ["GET", "HEAD"]
  compress               = true
  viewer_protocol_policy = "redirect-to-https"

  error_code_1         = 403
  response_code_1      = 403
  response_page_path_1 = "/index.html"

  error_code_2         = 404
  response_code_2      = 404
  response_page_path_2 = "/index.html"

  price_class = "PriceClass_200"

  restriction_type = "none"

  minimum_protocol_version = "TLSv1.2_2021"
  ssl_support_method       = "sni-only"

}
