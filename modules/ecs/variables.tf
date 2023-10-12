variable "project_name" {
  type        = string
  description = "The Project Name"
}
variable "environment" {
  type        = string
  description = "The Project Environment"
}
variable "ecs_task_count" {
  type        = number
  description = "ECS task desired count"
}
variable "min_health_percent" {
  type        = number
  description = "ECS deployment minimum health percent"
}
variable "max_percent" {
  type        = number
  description = "ECS deployment maximum percent"
}
variable "launch_type" {
  type        = string
  description = "ECS service launch Type"
}
variable "scheduling_strategy" {
  type        = string
  description = "ECS service scheduling strategy"
}
variable "ecs_task_memory" {
  type        = number
  description = "ECS task memory"
}
variable "ecs_task_cpu" {
  type        = number
  description = "ECS task cpu"
}
variable "acc_id" {
  type        = string
  description = "AWS account id"
}
variable "region" {
  type        = string
  description = "The region in which AWS resource has been provisoned"
}

variable "api_sg" {
  type        = string
  description = "Security Group for ECS CLuster"
}
variable "api_tg" {
  type        = string
  description = "Target Group for Loadbalancer"
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
  description = "VPC public subnet 3"
}
