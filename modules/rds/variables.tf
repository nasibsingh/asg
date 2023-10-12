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
variable "project_name" {
  type        = string
  description = "The Project Name"
}
variable "environment" {
  type        = string
  description = "The Project Environment"
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
variable "rds_db_sg" {
  type        = string
  description = "RDS db security group"
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

