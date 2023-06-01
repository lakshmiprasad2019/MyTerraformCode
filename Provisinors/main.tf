data "aws_ami" "app_ami" {
  owners      = ["amazon"]
  most_recent = true


  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10**"]
  }
}
resource "aws_instance" "instance-1" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  key_name      = "kalyan_nvirginia"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("kalyan_nvirginia.pem")
    host        = self.public_ip
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.instance-1.private_ip} >> private_ips.txt"
  }
  provisioner "local-exec" {
    command = "echo Destroy time provisioner"

    when = destroy
  }

}
output "mypublicIP" {
  value = aws_instance.instance-1.public_ip
}
