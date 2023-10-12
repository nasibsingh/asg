# Amazon Relational Database Service (RDS)

This child module contains Amazon Relational Database Service (RDS) resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf

### Usage

To Use this child module, add a 'module' block in main.tf file of (Root Module of) the required environment(stg/prod).
hb_scale >environment >stg/prod

```hcl
module "rds" {
  source                  = "../../modules/rds"
  db_name                 = var.db_name
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  project_name            = var.project_name
  environment             = var.environment
  username                = var.username
  password                = var.password
  parameter_group_name    = var.parameter_group_name
  backup_retention_period = var.backup_retention_period
  db_storage_type         = var.db_storage_type
  db_identifier           = var.db_identifier
  multi_az                = var.multi_az
  rds_db_sg               = module.sg.rds_db_sg
  publicsubnets_1         = module.vpc.publicsubnets_1
  publicsubnets_2         = module.vpc.publicsubnets_2
  publicsubnets_3         = module.vpc.publicsubnets_3
}
```
