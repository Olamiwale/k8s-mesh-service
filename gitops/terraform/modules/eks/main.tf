resource "aws_eks_cluster" "cluster" {
    name     = var.cluster_name
    role_arn = var.cluster
    version  = "1.29"

   vpc_config {
    subnet_ids = var.subnet_ids
  } 
 depends_on = [var.cluster_role  ]
}

