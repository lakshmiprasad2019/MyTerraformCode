resource "aws_instance" "example" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "tf-example"
  }
}
data "aws_ami" "app_ami" {
  owners      = ["amazon"]
  most_recent = true


  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10**"]
  }
}
