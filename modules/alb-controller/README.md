## Module: alb-controller

Provisiona o AWS Load Balancer Controller usando IRSA + Helm.

## Recursos principais
- IAM policy do controller
- IAM role com trust policy para OIDC do cluster
- Kubernetes Service Account com annotation de role ARN
- Helm release `aws-load-balancer-controller`

## Inputs
| Nome | Tipo | Default | Descrição |
|------|------|---------|-----------|
| `project_name` | `string` | n/a | Nome base dos recursos |
| `tags` | `map(any)` | n/a | Tags comuns |
| `oidc-identity` | `string` | n/a | URL do issuer OIDC do cluster |
| `cluster_name` | `string` | n/a | Nome do cluster EKS |
| `alb_controller_chart_version` | `string` | `"1.12.0"` | Versão do chart Helm |

## Outputs
Sem outputs.

## Notas
- O ServiceAccount é criado pelo Terraform (`serviceAccount.create=false` no chart).
- O nome do ServiceAccount e o `sub` no trust policy precisam permanecer alinhados.

## Referência Terraform (Gerado)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.eks-controller-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.alb-controller-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.alb-controller-role-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.helm-controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account_v1.eks-controller-sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_controller_chart_version"></a> [alb\_controller\_chart\_version](#input\_alb\_controller\_chart\_version) | Versao do chart Helm do AWS Load Balancer Controller | `string` | `"1.12.0"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | nome do cluster | `string` | n/a | yes |
| <a name="input_oidc-identity"></a> [oidc-identity](#input\_oidc-identity) | HTTP url do OIDC provider - EKS Cluster | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | adicionar TAGs nos recursos | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
