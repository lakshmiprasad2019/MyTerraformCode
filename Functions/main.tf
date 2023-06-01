locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {

}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0dc2d3e4c0f9ebd18"
    "us-west-2"  = "ami-0dc8f589abe99f538"
    "ap-south-1" = "ami-04f6f742e1d9012e3"
  }
}



resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"

  count = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}
output "timestamp" {
  value = local.time
}
