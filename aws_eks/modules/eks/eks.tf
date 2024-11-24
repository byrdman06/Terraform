resource "aws_eks_cluster" "tf_eks" {
  name     = var.eksclustername
  role_arn = var.aws_eks_role

  vpc_config {
    subnet_ids = [
        var.subnet1id,
        var.subnet2id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
}

resource "aws_eks_node_group" "tfeksnodegroup" {
  cluster_name    = aws_eks_cluster.tf_eks.name
  node_group_name = var.eksnodegroupname
  node_role_arn   = var.aws_eksnodegrouprole
  subnet_ids      = [
    var.subnet1id,
    var.subnet2id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}