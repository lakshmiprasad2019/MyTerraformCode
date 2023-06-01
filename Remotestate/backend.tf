terraform {
  backend "s3" {
    bucket         = "b639e"
    key            = "remotedemo.tfstate"
    region         = "us-east-2"
    dynamodb_table = "mystatelock"
  }
}
