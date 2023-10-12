# Amazon Simple Storage Service (S3)

This child module contains Amazon Simple Storage Service (S3) resource configuration:

- main set of configuration for child module - main.tf
- input terraform variables for child module - variables.tf
- share data from this child module to the root module - outputs.tf
- local variables used in this child module - locals.tf
- get information about resources external to Terraform, and use them to set up other resources inside this child module - data.tf

### Usage

To Use this child module, add a 'module' block in main.tf file of the Root Module of the required environment(stg/prod).
hb_scale >environment >stg/prod

```hcl
module "s3" {
  source                                    = "../../modules/s3_4"
  project_name                              = var.project_name
  environment                               = var.environment
  bucket_name                               = var.bucket_name
  cloudfront_origin_access_identity_oai_arn = module.cloudfront.cloudfront_origin_access_identity_oai_arn

}
```
