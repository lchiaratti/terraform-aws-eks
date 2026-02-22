## Module: cluster

Provisiona o cluster EKS, IAM role do control plane, OIDC provider e addons gerenciados.

## Recursos principais
- `aws_eks_cluster`
- `aws_iam_role` + `aws_iam_role_policy_attachment` para o cluster
- `aws_iam_openid_connect_provider`
- `aws_eks_addon` (dinâmico por `cluster_addons`)

## Inputs
| Nome | Tipo | Default | Descrição |
|------|------|---------|-----------|
| `project_name` | `string` | n/a | Nome base dos recursos |
| `tags` | `map(any)` | n/a | Tags comuns |
| `private_subnet_1a` | `string` | n/a | Subnet privada da AZ-a |
| `private_subnet_1b` | `string` | n/a | Subnet privada da AZ-b |
| `cluster_version` | `string` | n/a | Versão do Kubernetes no cluster |
| `endpoint_private_access` | `bool` | `true` | Habilita endpoint privado |
| `endpoint_public_access` | `bool` | `false` | Habilita endpoint público |
| `endpoint_public_access_cidrs` | `list(string)` | `[]` | CIDRs permitidos no endpoint público |
| `enabled_cluster_log_types` | `list(string)` | `[]` | Logs de controle habilitados |
| `cluster_addons` | `list(string)` | `["coredns", "kube-proxy", "vpc-cni"]` | Addons gerenciados |
| `cluster_addon_versions` | `map(string)` | `{}` | Versões por addon |

## Outputs
| Nome | Descrição |
|------|-----------|
| `cluster_name` | Nome/ID do cluster EKS |
| `endpoint` | Endpoint da API do cluster |
| `certificate-authority` | CA em base64 para acesso Kubernetes/Helm |
| `oidc` | Thumbprints do certificado OIDC |
| `oidc-identity` | URL do issuer OIDC |
| `oidc-indentity` | Alias legado (compatibilidade; typo mantido) |

## Notas
- O módulo exige CIDR público quando `endpoint_public_access = true`.
- O endpoint privado é recomendado como padrão.

## Referência Terraform (Gerado)

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
| [aws_eks_addon.managed_addons](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.eks-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_openid_connect_provider.eks-oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cluster-role-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_addon_versions"></a> [cluster\_addon\_versions](#input\_cluster\_addon\_versions) | Versoes dos addons gerenciados do EKS por nome | `map(string)` | `{}` | no |
| <a name="input_cluster_addons"></a> [cluster\_addons](#input\_cluster\_addons) | Lista de addons gerenciados do EKS | `list(string)` | <pre>[<br/>  "coredns",<br/>  "kube-proxy",<br/>  "vpc-cni"<br/>]</pre> | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Versao do Kubernetes para o cluster EKS | `string` | n/a | yes |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | Tipos de logs de controle habilitados no EKS | `list(string)` | `[]` | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Habilita endpoint privado da API do EKS | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Habilita endpoint público da API do EKS | `bool` | `false` | no |
| <a name="input_endpoint_public_access_cidrs"></a> [endpoint\_public\_access\_cidrs](#input\_endpoint\_public\_access\_cidrs) | Lista de CIDRs autorizados no endpoint público da API do EKS | `list(string)` | `[]` | no |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | Subnet privada para o EKs cluster AZ 1a | `string` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | Subnet privada para o EKs cluster AZ 1b | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | adicionar TAGs nos recursos | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate-authority"></a> [certificate-authority](#output\_certificate-authority) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
| <a name="output_oidc-identity"></a> [oidc-identity](#output\_oidc-identity) | n/a |
| <a name="output_oidc-indentity"></a> [oidc-indentity](#output\_oidc-indentity) | n/a |
<!-- END_TF_DOCS -->
