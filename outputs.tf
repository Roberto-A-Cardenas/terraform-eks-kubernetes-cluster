output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "cluster_ca" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "node_group_role" {
  value = aws_iam_role.eks_node_role.arn
}
