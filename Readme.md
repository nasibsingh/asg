# General

- Description: This directory contains different environments and the modules used in those environments.
- Provider Dependencies:
  - Provider: AWS
  - Provider Version: v4.42.0
- Terraform Version: v1.3.5
- Folder Structure

```shell
                  ------environment
                            !-----prod
                                      !-----main.tf
                                      !-----backend.tf
                                      !-----variables.tf
                                      !-----terraform.tfvars

                            !-----stg
                                      !-----main.tf
                                      !-----backend.tf
                                      !-----variables.tf
                                      !-----terraform.tfvars
                  ------modules
                            !-----alb
                                      !-----main.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----static_website
                                      !-----main.tf
                                      !-----data.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----static_website_2
                                      !-----main.tf
                                      !-----data.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----static_website_3
                                      !-----main.tf
                                      !-----data.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----cloudfront_backend
                                      !-----main.tf
                                      !-----data.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----ecr
                                      !-----main.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----ecs
                                      !-----main.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----rds
                                      !-----main.tf
                                      !-----data.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----s3_4
                                      !-----main.tf
                                      !-----data.tf
                                      !-----locals.tf
                                      !-----outputs.tf
                                      !-----variables.tf

                            !-----sg
                                      !-----main.tf
                                      !-----outputs.tf
                                      !-----variables.tf

```

- The Root module contains:

  - main set of configuration for the root module (providers and modules used) - main.tf
  - instruction to load and run the terraform state - backend.tf
  - input terraform variables used in the child modules - variables.tf
  - values of input variables used in the child modules - terraform.tfvars

- The child module contains:

  - main set of configuration for a child module - main.tf
  - input terraform variables for a child module - variables.tf
  - share data from a child module to the root module - outputs.tf
  - local variables used in a child module - locals.tf
  - get information about resources external to Terraform, and use them to set up other resources inside a child module - data.tf

### Terraform Backend

Each terraform environment module (stg & prod) has its state stored in same S3 and locking mechanism with AWS DynamoDB.

## Installing Terraform

### Ubuntu/Debian

```shell
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

### MacOs

```shell
brew tap hashicorp/tap

brew install hashicorp/tap/terraform
```

## How to use it

Each environment has its own root module.

- Staging

  - environment >stg

- Production

  - environment >prod

### To make changes to the infrastructure configurations of any child module used in the Root Module

- add new input variables to the configuration - variables.tf
- edit the values of the input variables - terraform.tfvars
- edit the values of the local variables - locals.tf

Note:

- New input variables defined in 'child_module >variables.tf', need also to be defined in 'root_module >variables.tf', and their values are stored in 'root_modules >terraform.tfvars'.
- Local variables are defined in 'child_module >locals.tf'.

### Pre-configuration

Instructions on the manual resources that need to be created before running terraform scripts

3 resources need to be created

1.  S3 to save the .tfstate files
2.  Dynamodb table
3.  Systems manager parameter

#### Creating an S3 bucket:

1.  Go to Amazon S3 console
2.  Click 'Cretae Bucket"
3.  Enter Bucket name - "iqboard-terraformstate-bucket"
4.  Select AWS region - "ap-southeast-2"
5.  Object Ownership - "ACLs disabled"
6.  Block Public Access settings - Tick "Block all public access"
7.  Bucket Versioning - "Enable"
8.  Tags - "name = iqboard"
9.  Default encryption >Encryption key type - select "Amazon S3-managed keys (SSE-S3)"
10. Default encryption >Bucket Key - select "Disable"
11. Advanced Settings >Object Lock - "Disable"
12. Click on 'Create bucket'

#### Creating Dynamodb table

1.  Go to Dynamodb console
2.  Go to 'Tables'
3.  Click on 'Create Table'
4.  Enter Table name - "iqboard-terraformstate-locking"
5.  Partition key - "LockID"
    "String"
    _Note - Partition key is case sensitive_
6.  Table settings - "Customize settings"
7.  Table class - "DynamoDB Standard"
8.  Read/write capacity settings - "On-demand"
9.  Encryption at rest - "Owned by Amazon DynamoDB"
10. Tags - "Name = iqboard"
11. Click on 'Create table'

Since RDS DB credentials are save in AWS Systems manager Parameter Stores
We need to save the RDS DB credentials in the AWS Systems manager Parameter Stores

#### Creating Parameters

1.  Go to Systems manager
2.  Cick 'Parameter Store'
3.  Click "Create parameter"
4.  Enter Name - ex:- "iqboard-db-username-stg"
5.  Description - ex:- "iqboard database username staging"
6.  Tier - "Standard"
7.  Type - "String"
8.  Data type - "text"
9.  Value - "<The db username>"
10. Tags - "name = iqboard"
11. Click on 'Create parameter'

#### Update files

Update the values of the following parameters in 'main.tf'

- shared_config_files
- shared_credentials_files
- profile

Update the values of the following parameters in 'backend.tf'

- shared_credentials_files
- profile

### To create the infrastructure, run the following commands:

### For Staging

> cd environment/stg

Init backend

> terraform init

Plan

> terraform plan

Apply

> terraform apply

### For Production

> cd environment/prod

Init backend

> terraform init

Plan

> terraform plan

Apply

> terraform apply
