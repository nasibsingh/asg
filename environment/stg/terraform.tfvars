region       = "ap-southeast-2"
project_name = "kissps-ck"
environment  = "stg"

#ALB----------

ip_address_type      = "ipv4"
load_balancer_type   = "application"
lb_tg_protocol       = "HTTP"
lb_tg_target_type    = "instance"
lb_listener_port     = "8080"
lb_listener_protocol = "HTTP"

#RDS----------

db_name                 = "kisspscheckout"
allocated_storage       = "10"
engine                  = "postgres"
engine_version          = "14.7"
instance_class          = "db.t3.micro"
parameter_group_name    = "default.postgres14"
backup_retention_period = "14"
db_storage_type         = "gp2"
db_identifier           = "kissps-checkout-stg" #only lowercase alphanumeric characters and hyphens allowed in "identifier"
multi_az                = "false"

#S3----------

bucket_name = "web-panel"
# bucket_name_2 = "web-panel"
# bucket_name_3 = "web-panel-customer"
# bucket_name_4 = "media-upload"

#CLoudfront----------

acm_arn       = ""
domain_name   = ""
domain_name_2 = ""
# domain_name_3   = ""
api_domain_name = ""

#ECS----------

ecs_task_count      = "1"
min_health_percent  = "50"
max_percent         = "200"
launch_type         = "EC2"
scheduling_strategy = "REPLICA"
ecs_task_memory     = "256"
ecs_task_cpu        = "256"
acc_id              = ""

#VPC----------

subnet_1 = "subnet-34dcdc5d"
subnet_2 = "subnet-37dcdc5e"
subnet_3 = "subnet-7ae6b03c"
vpc      = "vpc-35dcdc5c"


#EC2----------

key_name      = "kissps_cicd"
ami_id        = "ami-0310483fb2b488153"
instance_type = "t3.medium"
