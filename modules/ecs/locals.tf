locals {

  cluster_name = "containerInsights"
  value        = "disabled"

  policy_arn_ECS_FullAccess = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
  policy_arn_ECR_FullAccess = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  policy_arn_S3_FullAccess  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  policy_arn_SM_RW          = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"

  ecs_TaskExecutionRole_name = "ecsTaskExecutionRole"
  ecs_TaskRole_name          = "ecsTaskRole"

}
