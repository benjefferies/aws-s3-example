terraform {
  backend "s3" {
    bucket = "aws-s3-lambda-state"
    key    = "dev"
    region = "eu-west-1"
  }
}