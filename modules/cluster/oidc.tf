data "tls_certificate" "eks-oidc-tls-certificate" {
  url = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks-oidc" {
  client_id_list = [
    "sts.amazonaws.com"
  ]
  thumbprint_list = data.tls_certificate.eks-oidc-tls-certificate.certificates[*].sha1_fingerprint
  url             = data.tls_certificate.eks-oidc-tls-certificate.url

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-oidc"
    }
  )
}