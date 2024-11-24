output "aws_eks_role" {
  value = aws_iam_role.tfeksclusterrole.arn
}

output "aws_eksnodegrouprole" {
  value = aws_iam_role.tfeksnodegrouprole.arn
}

output "eks_node_group_policy_attachments" {
  value = [
    aws_iam_role_policy_attachment.policya,
    aws_iam_role_policy_attachment.policyaa,
    aws_iam_role_policy_attachment.policyaaa,
  ]
}

output "eks_cluster_role_policy_attachment" {
  value = aws_iam_role_policy_attachment.policy
}