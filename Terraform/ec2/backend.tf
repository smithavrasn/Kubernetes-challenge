terraform {
  backend "s3" {
    bucket = "terraformstatefile17062024"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
