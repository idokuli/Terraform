variable "aws_region" {
  type    = string
  default = "eu-north-1"
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "ami" {
  type    = string
  default = "ami-04233b5aecce09244"
}
variable "key_path_public" {
  type    = string
  default = "C:\\Users\\User\\Desktop\\New folder (3)\\my_key_pair.pub"
}
variable "key_path_private" {
  type    = string
  default = "C:\\Users\\User\\Desktop\\New folder (3)\\my_key_pair"
}