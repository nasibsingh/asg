locals {
  ###CLOUDFRONT

  enabled                = true
  http_port              = 8080
  https_port             = 443
  origin_protocol_policy = "http-only"
  origin_ssl_protocols   = ["TLSv1.2"]

  allowed_methods        = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
  cached_methods         = ["HEAD", "GET", "OPTIONS"]
  viewer_protocol_policy = "redirect-to-https"
  compress               = false

  query_string = true
  headers      = ["*"]

  forward = "all"

  price_class = "PriceClass_200"

  restriction_type = "none"

  minimum_protocol_version = "TLSv1.2_2021"
  ssl_support_method       = "sni-only"

}
