locals {
  ###ALB

  #aws_lb
  internal                   = false
  enable_http2               = true
  enable_deletion_protection = false
  idle_timeout               = "60"
  enable_waf_fail_open       = false

  #aws_lb_target_group
  port_tg              = 8080
  path_tg              = "/api/health-check"
  timeout_tg           = 2
  interval_tg          = 5
  deregistration_delay = 50

  #aws_lb_listener
  type = "forward"

  #Security Group
  #ingress1
  from_port_ingress_1   = 8080
  to_port_ingress_1     = 8080
  protocol_ingress_1    = "tcp"
  cidr_blocks_ingress_1 = ["0.0.0.0/0"]

  #ingress2
  from_port_ingress_2   = 8080
  to_port_ingress_2     = 8080
  protocol_ingress_2    = "tcp"
  cidr_blocks_ingress_2 = ["::/0"]

  #egress
  from_port_egress   = 0
  to_port_egress     = 0
  protocol_egress    = "-1"
  cidr_blocks_egress = ["0.0.0.0/0"]

}
