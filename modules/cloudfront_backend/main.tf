resource "aws_cloudfront_distribution" "cf_dist_cluster_lb" {
  enabled = local.enabled


  origin {
    domain_name = var.cluster_lb_dns
    origin_id   = var.cluster_lb
    custom_origin_config {
      http_port              = local.http_port
      https_port             = local.https_port
      origin_protocol_policy = local.origin_protocol_policy
      origin_ssl_protocols   = local.origin_ssl_protocols
    }
  }

  default_cache_behavior {
    allowed_methods        = local.allowed_methods
    cached_methods         = local.cached_methods
    target_origin_id       = var.cluster_lb
    viewer_protocol_policy = local.viewer_protocol_policy
    compress               = local.compress

    forwarded_values {
      query_string = local.query_string
      headers      = local.headers

      cookies {
        forward = local.forward
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = local.restriction_type
    }
  }

  price_class = local.price_class
  #aliases     = [var.api_domain_name]

  comment = "${var.project_name}-middleware-${var.environment}"

  tags = {
    name        = "${var.project_name}-middleware-${var.environment}"
    environment = var.environment
  }

  viewer_certificate {
    # acm_certificate_arn      = var.acm_arn
    minimum_protocol_version = local.minimum_protocol_version
    ssl_support_method       = local.ssl_support_method

    cloudfront_default_certificate = true
  }
}
