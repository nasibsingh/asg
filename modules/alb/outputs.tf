output "project_name" {
  value = var.project_name
}

output "environment" {
  value = var.environment
}

output "subnet_1" {
  value = var.subnet_1
}

output "subnet_2" {
  value = var.subnet_2
}

output "subnet_3" {
  value = var.subnet_3
}

output "vpc_id" {
  value = var.vpc
}

output "cluster_lb_dns" {
  value = aws_lb.cluster_lb.dns_name
}

output "cluster_lb" {
  value = aws_lb.cluster_lb.id
}

output "api_tg" {
  value = aws_lb_target_group.api_tg.arn
}
