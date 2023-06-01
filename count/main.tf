resource "aws_instance" "web-1" {
  ami           = var.ami
  instance_type = var.ec2type
  key_name      = var.key
  count         = 2

  tags = {
    Name = "Myfirstec2-1"
  }
}
