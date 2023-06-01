variable "region" {
  default = "ap-south-1"
}
variable "ami" {
  default = "ami-0b08bfc6ff7069aff"
}
variable "ec2type" {
  type = map(any)
  default = {
    a          = "1"
    ap-south-1 = "t2.medium"
    us-west-1  = "c5.large"
  }
}
variable "key" {
  default = "kalyan_mumbai"
}
variable "vpccidr" {
  default = "19.19.0.0/16"
}
