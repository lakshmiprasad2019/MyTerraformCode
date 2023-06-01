resource "aws_iam_user" "myproduser" {
  name  = "myproduser"
  count = var.isprod == yes ? 1 : 0
  path  = "/system/"
}
resource "aws_iam_user" "mytestuser" {
  name  = "mytestuser"
  count = var.isprod == no ? 1 : 0
  path  = "/system/"
}

variable "isprod" {

}
