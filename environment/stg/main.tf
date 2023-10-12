provider "aws" {
  shared_config_files      = ["/Users/memorres/.aws/conf"]
  shared_credentials_files = ["/Users/memorres/.aws/credentials"]
  profile                  = "kissps-checkout"
  region                   = var.region
}


#frontend modules

# module "s3_media_upload" {
#   source        = "../../modules/s3_media_upload"
#   project_name  = var.project_name
#   environment   = var.environment
#   bucket_name_4 = var.bucket_name_4

# }

module "static_website" {
  source       = "../../modules/static_website"
  environment  = var.environment
  bucket_name  = var.bucket_name
  project_name = var.project_name
  acm_arn      = var.acm_arn
  domain_name  = var.domain_name
}

# module "static_website_2" {
#   source       = "../../modules/static_website_2"
#   environment  = var.environment
#   bucket_name  = var.bucket_name_2
#   project_name = var.project_name
#   acm_arn      = var.acm_arn
#   domain_name  = var.domain_name_2
# }

# module "static_website_3" {
#   source       = "../../modules/static_website_3"
#   environment  = var.environment
#   bucket_name  = var.bucket_name_3
#   project_name = var.project_name
#   acm_arn      = var.acm_arn
#   domain_name  = var.domain_name_3
# }

#backend modules

module "alb" {
  source               = "../../modules/alb"
  project_name         = var.project_name
  environment          = var.environment
  subnet_1             = var.subnet_1
  subnet_2             = var.subnet_2
  subnet_3             = var.subnet_3
  vpc                  = var.vpc
  ip_address_type      = var.ip_address_type
  load_balancer_type   = var.load_balancer_type
  lb_tg_protocol       = var.lb_tg_protocol
  lb_tg_target_type    = var.lb_tg_target_type
  lb_listener_port     = var.lb_listener_port
  lb_listener_protocol = var.lb_listener_protocol
}

module "cloudfront_backend" {
  source          = "../../modules/cloudfront_backend"
  environment     = var.environment
  cluster_lb      = module.alb.cluster_lb
  cluster_lb_dns  = module.alb.cluster_lb_dns
  project_name    = var.project_name
  acm_arn         = var.acm_arn
  api_domain_name = var.api_domain_name
}

module "ecr" {
  source       = "../../modules/ecr"
  project_name = var.project_name
  environment  = var.environment
}

module "ecs" {
  source              = "../../modules/ecs"
  project_name        = var.project_name
  environment         = var.environment
  ecs_task_count      = var.ecs_task_count
  min_health_percent  = var.min_health_percent
  max_percent         = var.max_percent
  launch_type         = var.launch_type
  scheduling_strategy = var.scheduling_strategy
  ecs_task_memory     = var.ecs_task_memory
  ecs_task_cpu        = var.ecs_task_cpu
  acc_id              = var.acc_id
  region              = var.region
  api_sg              = module.sg.api_sg
  api_tg              = module.alb.api_tg
  subnet_1            = var.subnet_1
  subnet_2            = var.subnet_2
  subnet_3            = var.subnet_3
}

module "rds" {
  source                  = "../../modules/rds"
  db_name                 = var.db_name
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  project_name            = var.project_name
  environment             = var.environment
  parameter_group_name    = var.parameter_group_name
  backup_retention_period = var.backup_retention_period
  db_storage_type         = var.db_storage_type
  db_identifier           = var.db_identifier
  multi_az                = var.multi_az
  rds_db_sg               = module.sg.rds_db_sg
  subnet_1                = var.subnet_1
  subnet_2                = var.subnet_2
  subnet_3                = var.subnet_3
}

module "sg" {
  source       = "../../modules/sg"
  project_name = var.project_name
  environment  = var.environment
  vpc          = var.vpc
}

#CICD server

module "ec2" {
  source        = "../../modules/ec2"
  project_name  = var.project_name
  environment   = var.environment
  key_name      = var.key_name
  region        = var.region
  vpc           = var.vpc
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
