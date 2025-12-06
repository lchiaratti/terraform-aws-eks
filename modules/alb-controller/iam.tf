resource "aws_iam_role" "alb-controller-role" {
  name = "${var.project_name}-alb-controller-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}:aud": "sts.amazonaws.com",
                    "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
                }
            }
        }
    ]
}
EOF

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-alb-controller-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "alb-controller-role-attach" {
  role       = aws_iam_role.alb-controller-role.name
  policy_arn = aws_iam_policy.eks-controller-policy.arn
}