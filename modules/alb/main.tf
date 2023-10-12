resource "aws_lb" "cluster_lb" {
  name               = "${var.project_name}-cluster-lb-${var.environment}"
  internal           = local.internal
  load_balancer_type = var.load_balancer_type
  enable_http2       = local.enable_http2
  ip_address_type    = var.ip_address_type
  security_groups    = [aws_security_group.cluster_lb_sg.id]
  subnet_mapping {
    subnet_id = var.subnet_1
  }
  subnet_mapping {
    subnet_id = var.subnet_2
  }
  subnet_mapping {
    subnet_id = var.subnet_3
  }

  enable_deletion_protection = local.enable_deletion_protection
  idle_timeout               = local.idle_timeout
  enable_waf_fail_open       = local.enable_waf_fail_open

  tags = {
    name        = "${var.project_name}-cluster-lb-${var.environment}"
    environment = "${var.environment}"
  }
}

#Target Groups
resource "aws_lb_target_group" "api_tg" {
  name        = "${var.project_name}-middleware-tg-${var.environment}"
  port        = local.port_tg
  protocol    = var.lb_tg_protocol
  target_type = var.lb_tg_target_type
  vpc_id      = var.vpc
  health_check {
    path     = local.path_tg
    timeout  = local.timeout_tg
    interval = local.interval_tg
  }
  deregistration_delay = local.deregistration_delay
  tags = {
    name        = "${var.project_name}-middleware-tg-${var.environment}"
    environment = "${var.environment}"
  }
}

resource "aws_lb_listener" "cluster_lb_listener" {
  load_balancer_arn = aws_lb.cluster_lb.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol

  default_action {
    type             = local.type
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
  tags = {
    name        = "${var.project_name}-cluster-lb-listener-${var.environment}"
    environment = "${var.environment}"
  }
}


##Security Group

resource "aws_security_group" "cluster_lb_sg" {
  name        = "${var.project_name}-cluster-lb-sg-${var.environment}"
  description = "${var.project_name}-cluster-lb-sg-${var.environment}"
  vpc_id      = var.vpc

  ingress {
    description = "Allows inbound access from any IPv4 address"
    from_port   = local.from_port_ingress_1
    to_port     = local.to_port_ingress_1
    protocol    = local.protocol_ingress_1
    cidr_blocks = local.cidr_blocks_ingress_1

  }

  ingress {

    description      = "Allows inbound access from any IPv6 address"
    from_port        = local.from_port_ingress_2
    to_port          = local.to_port_ingress_2
    protocol         = local.protocol_ingress_2
    ipv6_cidr_blocks = local.cidr_blocks_ingress_2
  }

  egress {

    description = "Allows all outbound IPv4 traffic"
    from_port   = local.from_port_egress
    to_port     = local.to_port_egress
    protocol    = local.protocol_egress
    cidr_blocks = local.cidr_blocks_egress
  }

  tags = {
    Name        = "${var.project_name}-cluster-lb-sg-${var.environment}"
    environment = "${var.environment}"
  }
}
