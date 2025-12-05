output "oidc" {
  value = data.tls_certificate.eks-oidc-tls-certificate.certificates[*].sha1_fingerprint
}

output "cluster_name" {
  value = aws_eks_cluster.eks-cluster.id
}