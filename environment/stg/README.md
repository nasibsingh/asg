# Root Module (Staging)

## General

- Description: This is the root module for AWS Infrastructure being deployed on Staging environment using Terraform.
- Provider Dependencies:
  - Provider: AWS
  - Provider Version: v4.42.0
- Terraform Version: v1.3.5

- This Root module contains:

  - main set of configuration for the root module (including providers and modules used) - main.tf
  - instruction to load and run the terraform state - backend.tf
  - input terraform variables used in the child modules - variables.tf
  - values of input variables used in the child modules - terraform.tfvars

### Terraform Backend

Each terraform environment module (stg & prod) has its state stored in same S3 and locking mechanism with AWS DynamoDB.

## How to use it

### Pre-configuration

Update the values of the following parameters in 'main.tf'

- shared_config_files
- shared_credentials_files
- profile

Update the values of the following parameters in 'backend.tf'

- shared_credentials_files
- profile

### To make changes to the infrastructure configurations of any child module used in the Root Module

- add new input variables to the configuration - variables.tf
- edit the values of the input variables - terraform.tfvars
- edit the values of the local variables - locals.tf

Note:

- New input variables defined in 'child_module >variables.tf', need also to be defined in 'root_module >variables.tf', and their values are stored in 'root_modules >terraform.tfvars'.
- Local variables are defined in 'child_module >locals.tf'.

To create the infrastructure, run the following commands:

### For Staging

> cd environment/stg

Init backend

> terraform init

Plan

> terraform plan

Apply

> terraform apply
