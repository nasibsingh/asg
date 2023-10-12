# Static Website hosting

This child module contains Amazon Cloudfront and Amazon S3 resources in Static Website hosting configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf
- get information about resources external to Terraform, and use them to set up other resources inside this child module - data.tf

### Usage

To Use this child module, add a 'module' block in main.tf file of the Root Module of the required environment (stg/prod).

hb_scale >environment >stg/prod >main.tf

```hcl
module "static_website" {
  source       = "../../modules/static_website"
  environment  = var.environment
  bucket_name  = var.bucket_name
  project_name = var.project_name
  acm_arn      = var.acm_arn
  domain_name  = var.domain_name
}
```
