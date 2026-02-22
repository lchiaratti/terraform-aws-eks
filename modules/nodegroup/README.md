## Module: nodegroup

Provisiona um EKS Managed Node Group com IAM role e políticas mínimas necessárias.

## Recursos principais
- `aws_eks_node_group`
- `aws_iam_role` para nodes
- Attach de policies IAM:
- `AmazonEKSWorkerNodePolicy`
- `AmazonEC2ContainerRegistryReadOnly`
- `AmazonEKS_CNI_Policy`

## Inputs
| Nome | Tipo | Default | Descrição |
|------|------|---------|-----------|
| `project_name` | `string` | n/a | Nome base dos recursos |
| `tags` | `map(any)` | n/a | Tags comuns |
| `cluster_name` | `string` | n/a | Nome do cluster EKS |
| `private_subnet_1a` | `string` | n/a | Subnet privada AZ-a |
| `private_subnet_1b` | `string` | n/a | Subnet privada AZ-b |
| `node_desired_size` | `number` | `2` | Desired do node group |
| `node_min_size` | `number` | `2` | Mínimo do node group |
| `node_max_size` | `number` | `4` | Máximo do node group |
| `node_instance_types` | `list(string)` | `["t3.medium"]` | Tipos de instância |
| `node_capacity_type` | `string` | `"ON_DEMAND"` | `ON_DEMAND` ou `SPOT` |
| `node_disk_size` | `number` | `20` | Disco dos nodes em GiB |
| `node_max_unavailable` | `number` | `1` | Máx. indisponíveis no update |

## Outputs
Sem outputs.

## Validações
- `node_capacity_type` aceita apenas `ON_DEMAND` ou `SPOT`.
- Escala deve respeitar `node_min_size <= node_desired_size <= node_max_size`.

## Referência Terraform (Gerado)

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
| <a name="input_node_capacity_type"></a> [node\_capacity\_type](#input\_node\_capacity\_type) | Tipo de capacidade do node group: ON\_DEMAND ou SPOT | `string` | `"ON_DEMAND"` | no |
| <a name="input_node_desired_size"></a> [node\_desired\_size](#input\_node\_desired\_size) | Quantidade desejada de nodes no node group | `number` | `2` | no |
| <a name="input_node_disk_size"></a> [node\_disk\_size](#input\_node\_disk\_size) | Tamanho do disco (GiB) por node no node group | `number` | `20` | no |
| <a name="input_node_instance_types"></a> [node\_instance\_types](#input\_node\_instance\_types) | Tipos de instancia EC2 para o node group | `list(string)` | <pre>[<br/>  "t3.medium"<br/>]</pre> | no |
| <a name="input_node_max_size"></a> [node\_max\_size](#input\_node\_max\_size) | Quantidade maxima de nodes no node group | `number` | `4` | no |
| <a name="input_node_max_unavailable"></a> [node\_max\_unavailable](#input\_node\_max\_unavailable) | Quantidade maxima de nodes indisponiveis durante update | `number` | `1` | no |
| <a name="input_node_min_size"></a> [node\_min\_size](#input\_node\_min\_size) | Quantidade minima de nodes no node group | `number` | `2` | no |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | Subnet para o EKs cluster AZ 1a | `string` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | Subnet para o EKs cluster AZ 1b | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | adicionar TAGs nos recursos | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
