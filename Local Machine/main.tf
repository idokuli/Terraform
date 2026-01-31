terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

variable "name1" {
    type = string
    default = "example1.txt"
}
variable "name2" {
    type = string
    default = "example2.txt"
}
variable "content" {
    type = string
    default = "i am file 1"
}
variable "content2" {
    type = string
    default = "i am file 2"
}
resource "local_file" "example_file" {
    filename = var.name1
    content = var.content
}
resource "local_file" "example2" {
    filename = var.name2
    content = var.content2
}

output "example_file_path" {
    value = local_file.example_file.filename
}
output "example2_file_path" {
    value = local_file.example2.filename
}