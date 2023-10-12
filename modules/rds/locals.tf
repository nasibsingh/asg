locals {

  #DB Subnet Group
  name = "${var.project_name}-db-subnet-group-${var.environment}"

  #DB
  skip_final_snapshot = true
  publicly_accessible = true
  storage_encrypted   = true

  #KMS key
  kms_description = "AWS KMS Key for ${var.project_name} ${var.environment} to encrypt Database Activity Stream"

  #KMS alias
  kms_alias_name = "alias/iam_user_permissions_${var.project_name}_${var.environment}"

}
