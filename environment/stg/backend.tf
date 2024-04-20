terraform {
  backend "s3" {
    bucket                  = "terraform-state-bucket"
    key                     = "environment/stg/terraform.tfstate"
    region                  = ""
    dynamodb_table          = "terraform-state-locking"
    encrypt                 = true
    shared_credentials_file = "/Users/memorres/.aws/credentials"
    profile                 = ""
  }
}
