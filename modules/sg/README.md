# Amazon Security Groups

This child module contains Amazon Security Groups resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf

### Usage

To Use this child module, add a 'module' block in main.tf file of (Root Module of) the required environment(stg/prod).
hb_scale >environment >stg/prod

```hcl
module "sg" {
  source       = "../../modules/sg"
  project_name = var.project_name
  environment  = var.environment
  Main         = module.vpc.Main
}
```
