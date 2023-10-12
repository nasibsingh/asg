# resource "aws_security_group" "cicd_sg" {
#   name        = "${var.project_name}-cicd-sg-${var.environment}"
#   description = "${var.project_name}-cicd-sg-${var.environment}"
#   vpc_id      = var.vpc

#   ingress {
#     description = "Allows inbound HTTP access from any IPv4 address"
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allows inbound SSH access from any IPv4 address"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allows inbound HTTPS access from any IPv4 address"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allows all outbound IPv4 traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description      = "Allows all outbound IPv6 traffic"
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   tags = {
#     name        = "${var.project_name}-cicd-sg-${var.environment}"
#     environment = "${var.environment}"
#   }
# }

# module "key_pair" {
#   source = "terraform-aws-modules/key-pair/aws"

#   key_name           = var.key_name
#   create_private_key = true
# }

# resource "aws_instance" "cicd" {
#   ami           = var.ami_id
#   key_name      = var.key_name
#   instance_type = var.instance_type

#   tags = {
#     name = "${var.project_name}-cicd"
#   }
# }

# resource "aws_spot_instance_request" "cicd_spot" {
#   ami                            = var.ami_id
#   instance_type                  = var.instance_type
#   spot_type                      = "persistent"
#   wait_for_fulfillment           = "true"
#   key_name                       = var.key_name
#   instance_interruption_behavior = "stop"
#   security_groups                = [aws_security_group.cicd_sg.name]

#   tags = {
#     "Name" = "cln_cicd_spot_stg"
#   }
# }

# resource block for eip #
# resource "aws_eip" "ec2_instance" {
#   vpc = true
# }

# # resource block for ec2 and eip association #
# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.cicd.id
#   allocation_id = aws_eip.ec2_instance.id
# }
