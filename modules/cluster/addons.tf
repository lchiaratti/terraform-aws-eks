resource "aws_eks_addon" "managed_addons" {
  for_each = toset(var.cluster_addons)

  cluster_name                = aws_eks_cluster.eks-cluster.name
  addon_name                  = each.value
  addon_version               = lookup(var.cluster_addon_versions, each.value, null)
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}
