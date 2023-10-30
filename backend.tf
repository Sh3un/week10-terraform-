terraform {
  backend "s3" {
    bucket   = "ayosh3un"
    key      = "week10"
    region   = "us-east-1"
    encrypt = true
    dynamodb_table = "TerraformLock"
  }
}