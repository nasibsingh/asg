locals {

  #S3 Bucket Ownership
  object_ownership = "BucketOwnerPreferred"

  #Bloack Public Access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  #S3 Bucket ACL
  acl = "private"

  #Versioning
  status = "Disabled"

}
