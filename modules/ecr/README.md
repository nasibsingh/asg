# Amazon Elastic Container Registry (ECR)

This child module contains Amazon Elastic Container Registry (ECR) resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf

### Usage

To Use this child module, add a 'module' block in main.tf file of the Root Module of the required environment (stg/prod).

hb_scale >environment >stg/prod

```hcl
module "ecr" {
  source       = "../../modules/ecr"
  project_name = var.project_name
  environment  = var.environment
}
```
