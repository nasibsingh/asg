resource "aws_db_subnet_group" "default" {
  name       = local.name
  subnet_ids = [var.subnet_1, var.subnet_2, var.subnet_3]

  tags = {
    name        = "${var.project_name} db subnet group"
    environment = "${var.environment}"
  }
}
data "aws_ssm_parameter" "rds_username" {
  name            = "/${var.project_name}/${var.environment}/db-user"
  with_decryption = true
}
data "aws_ssm_parameter" "rds_password" {
  name            = "/${var.project_name}/${var.environment}/db-password"
  with_decryption = true
}
resource "aws_db_instance" "db" {
  #allocating the storage for database instance
  allocated_storage = var.allocated_storage

  #declaring the databse engine and engine_version
  engine         = var.engine
  engine_version = var.engine_version

  #declaring the instance class
  instance_class = var.instance_class
  db_name        = var.db_name

  #user to connect the database instance
  username = data.aws_ssm_parameter.rds_username.value

  #password to connect the database instance
  password = data.aws_ssm_parameter.rds_password.value


  parameter_group_name    = var.parameter_group_name
  backup_retention_period = var.backup_retention_period

  storage_type           = var.db_storage_type
  db_subnet_group_name   = aws_db_subnet_group.default.id
  vpc_security_group_ids = [var.rds_db_sg]
  skip_final_snapshot    = local.skip_final_snapshot
  identifier             = var.db_identifier
  publicly_accessible    = local.publicly_accessible
  storage_encrypted      = local.storage_encrypted
  multi_az               = var.multi_az
  deletion_protection    = true
  apply_immediately      = true

  tags = {
    name        = "${var.project_name}-db-${var.environment}"
    environment = "${var.environment}"
  }
}

# resource "aws_kms_key" "default" {
#   description = local.kms_description
#   tags = {
#     name        = "${var.project_name}"
#     environment = "${var.environment}"
#   }
# }

# resource "aws_kms_alias" "default" {
#   name          = local.kms_alias_name
#   target_key_id = aws_kms_key.default.key_id
# }
