resource "aws_eks_node_group" "eks-nodegroup" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.nodegroup_role.arn
  capacity_type   = var.node_capacity_type
  instance_types  = var.node_instance_types
  disk_size       = var.node_disk_size

  lifecycle {
    precondition {
      condition     = var.node_min_size <= var.node_desired_size && var.node_desired_size <= var.node_max_size
      error_message = "A escala do node group deve atender min <= desired <= max."
    }
  }

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
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  update_config {
    max_unavailable = var.node_max_unavailable
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodegroup-role-attach-worker,
    aws_iam_role_policy_attachment.nodegroup-role-attach-ecr,
    aws_iam_role_policy_attachment.nodegroup-role-attach-cni,
  ]
}
