<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_openid_connect_provider.eks-oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cluster-role-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group_rule.eks-cluster-sg-rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [tls_certificate.eks-oidc-tls-certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | nome do cluster | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_public_subnet_1a"></a> [public\_subnet\_1a](#input\_public\_subnet\_1a) | Subnet para o EKs cluster AZ 1a | `string` | n/a | yes |
| <a name="input_public_subnet_1b"></a> [public\_subnet\_1b](#input\_public\_subnet\_1b) | Subnet para o EKs cluster AZ 1b | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | adicionar TAGs nos recursos | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate-authority"></a> [certificate-authority](#output\_certificate-authority) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
| <a name="output_oidc-indentity"></a> [oidc-indentity](#output\_oidc-indentity) | n/a |
<!-- END_TF_DOCS -->