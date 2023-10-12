terraform {
  backend "s3" {
    bucket                  = "kissps-checkout-terraformstate-bucket"
    key                     = "environment/stg/terraform.tfstate"
    region                  = "ap-southeast-2"
    dynamodb_table          = "kissps-checkout-terraformstate-locking"
    encrypt                 = true
    shared_credentials_file = "/Users/memorres/.aws/credentials"
    profile                 = "kissps-checkout"
  }
}
