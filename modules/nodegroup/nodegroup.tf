resource "aws_eks_node_group" "eks-nodegroup" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.nodegroup_role.arn
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-nodegroup"
    }
  )

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodegroup-role-attach-worker,
    aws_iam_role_policy_attachment.nodegroup-role-attach-ecr,
    aws_iam_role_policy_attachment.nodegroup-role-attach-cni,
  ]
}