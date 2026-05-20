# module/vpc/variable.tf

variable "project_name" {}
variable "cidr_block" {}
variable "public_subnets" {
    type = list(string)
}
variable "azs" {
    type = list(string)
}


