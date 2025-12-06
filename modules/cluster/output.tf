output "oidc" {
  value = data.tls_certificate.eks-oidc-tls-certificate.certificates[*].sha1_fingerprint
}

output "cluster_name" {
  value = aws_eks_cluster.eks-cluster.id
}

output "oidc-indentity" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}