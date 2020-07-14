
variable "region" {
  type    = string
  default = "us-west-2"
}
variable "environment" {
  type    = string
  default = "test"
}
variable "managed" {
  type = string
  default = "terraform"
}
variable "group" {
  type = string
  default = "infra"
}