<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks-nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.nodegroup_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.nodegroup-role-attach-cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nodegroup-role-attach-ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nodegroup-role-attach-worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | nome do cluster | `string` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | Subnet para o EKs cluster AZ 1a | `string` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | Subnet para o EKs cluster AZ 1b | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | adicionar TAGs nos recursos | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->