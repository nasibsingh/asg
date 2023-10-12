#cluster
resource "aws_ecs_cluster" "cluster" {
  name = "${var.project_name}-cluster-${var.environment}"

  setting {
    name  = local.cluster_name
    value = local.value
  }
  tags = {
    name        = "${var.project_name}_ecs_cluster"
    environment = "${var.environment}"
  }
}

# # create an iam user
# resource "aws_iam_user" "iam_user" {
#   name = "${var.project_name}_cicd_${var.environment}"
# }

# # give the iam user programatic access
# resource "aws_iam_access_key" "iam_access_key" {
#   user = aws_iam_user.iam_user.name
# }

# resource "aws_iam_user_policy_attachment" "AmazonECS_FullAccess" {
#   user       = aws_iam_user.iam_user.name
#   policy_arn = local.policy_arn_ECS_FullAccess
# }

# resource "aws_iam_user_policy_attachment" "AmazonEC2ContainerRegistryFullAccess" {
#   user       = aws_iam_user.iam_user.name
#   policy_arn = local.policy_arn_ECR_FullAccess
# }

# resource "aws_iam_user_policy_attachment" "AmazonS3FullAccess" {
#   user       = aws_iam_user.iam_user.name
#   policy_arn = local.policy_arn_S3_FullAccess
# }

# resource "aws_iam_user_policy_attachment" "SecretsManagerReadWrite" {
#   user       = aws_iam_user.iam_user.name
#   policy_arn = local.policy_arn_SM_RW
# }


# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = local.ecs_TaskExecutionRole_name

#   assume_role_policy = <<EOF
#   {
#    "Version": "2012-10-17",
#    "Statement": [
#      {
#        "Action": "sts:AssumeRole",
#        "Principal": {
#          "Service": "ecs-tasks.amazonaws.com"
#        },
#        "Effect": "Allow",
#        "Sid": ""
#      }
#    ]
#   }
#   EOF
# }
# resource "aws_iam_role" "ecs_task_role" {
#   name = local.ecs_TaskRole_name

#   assume_role_policy = <<EOF
#   {
#    "Version": "2012-10-17",
#    "Statement": [
#      {
#        "Action": "sts:AssumeRole",
#        "Principal": {
#          "Service": "ecs-tasks.amazonaws.com"
#        },
#        "Effect": "Allow",
#        "Sid": ""
#      }
#    ]
#   }
#   EOF
# }

# resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }
# resource "aws_iam_role_policy_attachment" "ecs-task-role-policy-attachment" {
#   role       = aws_iam_role.ecs_task_role.name
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
# }

# resource "aws_ecs_service" "ecs-service" {
#   name            = "${var.project_name}-middleware-${var.environment}"
#   cluster         = aws_ecs_cluster.cluster.id
#   task_definition = aws_ecs_task_definition.ecs-task-definition.arn
#   desired_count   = var.ecs_task_count
#   #1
#   deployment_minimum_healthy_percent = var.min_health_percent
#   #50
#   deployment_maximum_percent = var.max_percent
#   #200
#   launch_type = var.launch_type
#   #"FARGATE"
#   scheduling_strategy = var.scheduling_strategy
#   #"REPLICA"
#   network_configuration {
#     security_groups  = [var.api_sg]
#     subnets          = [var.subnet_1, var.subnet_2, var.subnet_3]
#     assign_public_ip = true
#   }
#   load_balancer {
#     target_group_arn = var.api_tg
#     container_name   = "${var.project_name}-middleware-${var.environment}"
#     container_port   = 8080
#   }

#   tags = {
#     name        = "${var.project_name}_ecs_service"
#     environment = "${var.environment}"
#   }
# }

# resource "aws_ecs_task_definition" "ecs-task-definition" {
#   family                   = "${var.project_name}-middleware-${var.environment}"
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["EC2"]
#   memory                   = var.ecs_task_memory
#   #512
#   cpu = var.ecs_task_cpu
#   #256
#   execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
#   task_role_arn      = aws_iam_role.ecs_task_role.arn
#   container_definitions = jsonencode([{
#     name      = "${var.project_name}-middleware-${var.environment}",
#     image     = "${var.acc_id}.dkr.ecr.${var.region}.amazonaws.com/${var.project_name}-middleware-${var.environment}:1"
#     essential = true,
#     memory    = 256
#     portMappings = [
#       {
#         "protocol" : "tcp"
#         "containerPort" : 8080,
#         "hostPort" : 8080
#       }
#     ]
#     logConfiguration = {
#       "logDriver" : "awslogs",
#       "options" : {
#         "awslogs-group" : "${var.project_name}-middleware-${var.environment}",
#         "awslogs-region" : "${var.region}",
#         "awslogs-stream-prefix" : "middleware"
#       }
#     }
#   }])
#   tags = {
#     name        = "${var.project_name}_ecs_task_definition"
#     environment = "${var.environment}"
#   }

# }


# resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
#   name = "${var.project_name}-middleware-${var.environment}"
#   tags = {
#     name        = "${var.project_name}-log-group"
#     environment = "${var.environment}"
#   }
# }

# resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
#   name           = "${var.project_name}-middleware-${var.environment}"
#   log_group_name = aws_cloudwatch_log_group.cloudwatch_log_group.name
# }
