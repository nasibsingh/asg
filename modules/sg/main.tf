#api security group
resource "aws_security_group" "api_sg" {
  name        = "${var.project_name}-middleware-sg-${var.environment}"
  description = "${var.project_name}-middleware-sg-${var.environment}"
  vpc_id      = var.vpc

  ingress {
    description = "Allows inbound access from any IPv4 address"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"

  }

  egress {
    description = "Allows all outbound IPv4 traffic"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    name        = "${var.project_name}-middleware-sg-${var.environment}"
    environment = "${var.environment}"
  }

}

#rds security group
resource "aws_security_group" "db_sg" {
  name        = "${var.project_name}-db-sg-${var.environment}"
  description = "${var.project_name}-db-sg-${var.environment}"
  vpc_id      = var.vpc

  ingress {
    description     = "${var.project_name}-middleware-sg-${var.environment}"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.api_sg.id]
  }

  egress {
    description = "Allows all outbound IPv4 traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allows all outbound IPv6 traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    name        = "${var.project_name}-db-sg-${var.environment}"
    environment = "${var.environment}"
  }
}
