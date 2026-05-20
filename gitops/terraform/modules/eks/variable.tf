
variable "cluster_name" {}
variable "cluster_role" {}
variable "node_role" {}
variable "subnet_ids" {
    type = list(string)
}