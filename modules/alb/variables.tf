variable "project_name" {
  type        = string
  description = "The Project Name"
}
variable "environment" {
  type        = string
  description = "The project Environment"
}
variable "ip_address_type" {
  type        = string
  description = "AWS loadbalancer ip address type"
}
variable "load_balancer_type" {
  type        = string
  description = "Load balancer type"
}
variable "lb_tg_protocol" {
  type        = string
  description = "Load balancer target group protocol"
}
variable "lb_tg_target_type" {
  type        = string
  description = "Load balancer target type"
}
variable "lb_listener_port" {
  type        = string
  description = "Loadbalancer listener port"
}
variable "lb_listener_protocol" {
  type        = string
  description = "Loadbalancer listener protocol"
}


variable "vpc" {
  type        = string
  description = "VPC"
}

variable "subnet_1" {
  type        = string
  description = "VPC public subnet 1"
}
variable "subnet_2" {
  type        = string
  description = "VPC public subnet 2"
}
variable "subnet_3" {
  type        = string
  description = "VPS public subnet 3"
}
