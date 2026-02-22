## Module: network

Provisiona a rede base para o EKS em duas AZs.

## Recursos principais
- VPC com DNS habilitado.
- 2 subnets públicas e 2 privadas.
- Internet Gateway.
- 2 NAT Gateways (um por AZ).
- Rotas públicas e privadas + associações.

## Inputs
| Nome | Tipo | Default | Descrição |
|------|------|---------|-----------|
| `cidr_block` | `string` | n/a | CIDR da VPC |
| `project_name` | `string` | n/a | Nome base dos recursos |
| `tags` | `map(any)` | n/a | Tags comuns |

## Outputs
| Nome | Descrição |
|------|-----------|
| `subnet_pub_1a` | ID da subnet pública AZ-a |
| `subnet_pub_1b` | ID da subnet pública AZ-b |
| `subnet_priv_1a` | ID da subnet privada AZ-a |
| `subnet_priv_1b` | ID da subnet privada AZ-b |

## Notas
- As rotas privadas usam `nat_gateway_id` para saída à internet via NAT.
- Este módulo não cria NACLs customizadas; usa as padrão da VPC.

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
| [aws_eip.eks-ngw-eip_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eks-ngw-eip_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.eks_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.eks-ngw-1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.eks-ngw-1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.eks_rt_private-1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.eks_rt_private-1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.eks_rt_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.eks_rtb_assoc_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.eks_rtb_assoc_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.eks_rtb_assoc_priv_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.eks_rtb_assoc_priv_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.eks-subnet-private-1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks-subnet-private-1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks-subnet-public-1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks-subnet-public-1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Network VPC | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | adicionar TAGs nos recursos | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_priv_1a"></a> [subnet\_priv\_1a](#output\_subnet\_priv\_1a) | n/a |
| <a name="output_subnet_priv_1b"></a> [subnet\_priv\_1b](#output\_subnet\_priv\_1b) | n/a |
| <a name="output_subnet_pub_1a"></a> [subnet\_pub\_1a](#output\_subnet\_pub\_1a) | n/a |
| <a name="output_subnet_pub_1b"></a> [subnet\_pub\_1b](#output\_subnet\_pub\_1b) | n/a |
<!-- END_TF_DOCS -->
