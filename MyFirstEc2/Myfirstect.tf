resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key


  tags = {
    Name = "Myfirstec2"
  }
}

resource "aws_instance" "web-1" {
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key


  tags = {
    Name = "Myfirstec2-1"
  }
}


resource "aws_vpc" "myvpc" {
  cidr_block = var.vpccidr

}
