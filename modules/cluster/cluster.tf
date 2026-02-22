resource "aws_eks_cluster" "eks-cluster" {
  name                      = "${var.project_name}-cluster"
  role_arn                  = aws_iam_role.cluster_role.arn
  version                   = var.cluster_version
  enabled_cluster_log_types = var.enabled_cluster_log_types

  lifecycle {
    precondition {
      condition     = !var.endpoint_public_access || length(var.endpoint_public_access_cidrs) > 0
      error_message = "Defina ao menos um CIDR em endpoint_public_access_cidrs quando endpoint_public_access=true."
    }
  }


  vpc_config {
    subnet_ids = [
      var.private_subnet_1a,
      var.private_subnet_1b
    ]
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.endpoint_public_access ? var.endpoint_public_access_cidrs : null

  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster-role-attach
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}
