
variable "region" {
  type        = string
  description = "The region in which AWS resource has been provisioned"
}
variable "project_name" {
  type        = string
  description = "The Project Name"
}
variable "environment" {
  type        = string
  description = "The Project Environment"
}

#ALB----------

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

#RDS----------

variable "db_name" {
  type        = string
  description = "AWS RDS db name"
}
variable "allocated_storage" {
  type        = number
  description = "RDS DB allocated storage"
}
variable "engine" {
  type        = string
  description = "RDS db engine"
}
variable "engine_version" {
  type        = string
  description = "RDS db engine version"
}
variable "instance_class" {
  type        = string
  description = "RDS db instance"
}
variable "parameter_group_name" {
  type        = string
  description = "RDS db parameter group"
}
variable "backup_retention_period" {
  type        = string
  description = "Backup retention period of RDS db"
}
variable "db_storage_type" {
  type        = string
  description = "RDS db storage type"
}
variable "db_identifier" {
  type        = string
  description = "RDS db identifier"
}
variable "multi_az" {
  type        = string
  description = "Availability of DB in multiple Availability Zones"
}

#S3----------

variable "bucket_name" {
  type        = string
  description = "Super-admin S3 bucket name"
}
# variable "bucket_name_2" {
#   type        = string
#   description = "Company-admin S3 bucket name"
# }
# variable "bucket_name_3" {
#   type        = string
#   description = "Customer S3 bucket name"
# }
# variable "bucket_name_4" {
#   type        = string
#   description = "Programmatic Access S3 bucket name"
# }

#Cloudfront----------

variable "acm_arn" {
  type        = string
  description = "ACM certificate ARN"
}
variable "domain_name" {
  type        = string
  description = "domain name"
}
# variable "domain_name_2" {
#   type        = string
#   description = "domain name"
# }
# variable "domain_name_3" {
#   type        = string
#   description = "domain name"
# }
variable "api_domain_name" {
  type        = string
  description = "api domain name"
}

#ECS----------

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


#ECS----------

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
variable "vpc" {
  type        = string
  description = "VPC"
}

#EC2----------

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}
variable "ami_id" {
  type        = string
  description = "EC2 ami id"
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}
