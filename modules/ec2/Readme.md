# Amazon EC2 for Jenkins CICD server

This child module contains Amazon EC2 resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf

### Usage

To Use this module, add a 'module' block in main.tf file of the Root Module of the required environment (stg/prod).

hb_scale >environment >stg/prod >main.tf

```hcl
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
```
