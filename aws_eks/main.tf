module "vpc" {
  source = "./modules/vpc"

  vpccidr     = "10.0.0.0/16"
  vpcname     = "eks-vpc"
  subnet1cidr = "10.0.1.0/24"
  subnet1az   = "us-east-1a"
  subnet2az   = "us-east-1b"
  subnet2cidr = "10.0.2.0/24"
  sgname      = "eks_sg"
}

module "iam" {
  source = "./modules/iam"

  eksclusterrolename   = "tfeksclusterrole"
  eksnodegrouprolename = "tfeksnodegrouprolename"
}

module "eks" {
  source = "./modules/eks"

  eksclustername       = "tfekscluster"
  eksnodegroupname     = "tfnodegroup"
  subnet1id            = module.vpc.subnet1id
  subnet2id            = module.vpc.subnet2id
  aws_eks_role         = module.iam.aws_eks_role
  aws_eksnodegrouprole = module.iam.aws_eksnodegrouprole

  depends_on = [
    module.iam,
    module.vpc
  ]
}