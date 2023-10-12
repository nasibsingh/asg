variable "vpc" {
  description = "Default VPC"
}
variable "key_name" {
  description = "Name of keypair to ssh"
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}
variable "ami_id" {
  type        = string
  description = "EC2 ami id"
}

variable "project_name" {
  type        = string
  description = "The project Name"
}
variable "environment" {
  type        = string
  description = "The Project Environment"
}
variable "region" {
  type        = string
  description = "The region in which AWS resource has been provisioned"
}
