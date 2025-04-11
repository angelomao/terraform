module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.35.0"

  cluster_name    = "angelo-eks-cluster"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = "vpc-0b877e4c27184779d"
  subnet_ids = ["subnet-0b09dec5e01589355", "subnet-0a9afffc2941ee1ad", "subnet-0921162c1b7f1b24c"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}