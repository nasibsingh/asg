variable "environment" {
  type        = string
  description = "The Project Environment"
}
variable "cluster_lb_dns" {
  type        = string
  description = "DNS name for ECS Cluster Load Balancer"
}
variable "cluster_lb" {
  type        = string
  description = "ID of Load Balancer for ECS CLuster"
}
variable "project_name" {
  type        = string
  description = "The Project Name"
}
variable "acm_arn" {
  type        = string
  description = "ACM certificate ARN"
}
variable "api_domain_name" {
  type        = string
  description = "api domain name"
}
