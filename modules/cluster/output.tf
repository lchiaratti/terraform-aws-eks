output "eks-vpc-config" {
  value = aws_eks_cluster.eks-cluster.vpc_config
}

output "oidc" {
  value = data.tls_certificate.eks-oidc-tls-certificate.certificates[*].sha1_fingerprint
}