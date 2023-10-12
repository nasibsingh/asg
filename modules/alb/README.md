# Amazon Load Balancer

This child module contains Amazon Load Balancer resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf

### Usage

To Use this module, add a 'module' block in main.tf file of the Root Module of the required environment (stg/prod).

hb_scale >environment >stg/prod >main.tf

```hcl
module "alb" {
  source               = "../../modules/alb"
  project_name         = var.project_name
  environment          = var.environment
  publicsubnets_1      = module.vpc.publicsubnets_1
  publicsubnets_2      = module.vpc.publicsubnets_2
  publicsubnets_3      = module.vpc.publicsubnets_3
  Main                 = module.vpc.Main
  ip_address_type      = var.ip_address_type
  load_balancer_type   = var.load_balancer_type
  lb_tg_protocol       = var.lb_tg_protocol
  lb_tg_target_type    = var.lb_tg_target_type
  lb_listener_port     = var.lb_listener_port
  lb_listener_protocol = var.lb_listener_protocol
}
```
