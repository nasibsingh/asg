# Amazon Elastic Container Service (ECS)

This child module contains Amazon Elastic Container Service (ECS) resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf

### Usage

To Use this child module, add a 'module' block in main.tf file of the Root Module of the required environment (stg/prod).

hb_scale >environment >stg/prod

```hcl
module "ecs" {
  source              = "../../modules/ecs"
  project_name        = var.project_name
  environment         = var.environment
  ecs_task_count      = var.ecs_task_count
  min_health_percent  = var.min_health_percent
  max_percent         = var.max_percent
  launch_type         = var.launch_type
  scheduling_strategy = var.scheduling_strategy
  ecs_task_memory     = var.ecs_task_memory
  ecs_task_cpu        = var.ecs_task_cpu
  acc_id              = var.acc_id
  region              = var.region
  api_sg              = module.sg.api_sg
  api_tg              = module.alb.api_tg
}
```
