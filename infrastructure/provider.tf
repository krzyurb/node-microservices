provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "photos-terraform-state"
    key    = "state"
    region = "eu-central-1"
  }
}
