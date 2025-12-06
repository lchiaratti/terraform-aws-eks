resource "kubernetes_service_account_v1" "eks-controller-sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.alb-controller-role.arn
    }
  }
}
## nome tem que ser o mesmo do arquivo