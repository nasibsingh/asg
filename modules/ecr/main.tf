resource "aws_ecr_repository" "api" {
  name                 = "${var.project_name}-middleware-${var.environment}"
  image_tag_mutability = local.image_tag_mutability
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = local.scan_on_push
  }
  tags = {
    name = "${var.project_name}-middleware-${var.environment}"
  }
}

# resource "aws_ecr_repository_policy" "api-repo-policy" {
#   repository = aws_ecr_repository.api.name
#   policy     = <<EOF
#   {
#     "Version": "2008-10-17",
#     "Statement": [
#       {
#         "Sid": "adds full ecr access to the api repository",
#         "Effect": "Allow",
#         "Principal": "*",
#         "Action": [
#           "ecr:BatchCheckLayerAvailability",
#           "ecr:BatchGetImage",
#           "ecr:CompleteLayerUpload",
#           "ecr:GetDownloadUrlForLayer",
#           "ecr:GetLifecyclePolicy",
#           "ecr:InitiateLayerUpload",
#           "ecr:PutImage",
#           "ecr:UploadLayerPart"
#         ]
#       }
#     ]
#   }
#   EOF
# }
