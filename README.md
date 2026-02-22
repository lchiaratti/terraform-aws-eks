## Terraform AWS EKS Cluster

Módulo Terraform para provisionar um ambiente EKS completo com:
- Rede VPC com subnets públicas e privadas em duas AZs.
- Cluster EKS com endpoint privado por padrão.
- Node Group gerenciado e parametrizável.
- Addons gerenciados do EKS (`coredns`, `kube-proxy`, `vpc-cni`).
- AWS Load Balancer Controller via Helm + IRSA.

## Arquitetura
- `modules/network`: VPC, subnets, IGW, NAT Gateway e rotas.
- `modules/cluster`: EKS cluster, IAM role, OIDC provider e addons.
- `modules/nodegroup`: EKS managed node group + IAM role/policies.
- `modules/alb-controller`: IAM policy/role, service account e Helm release.

## Requisitos
- Terraform >= 1.5
- AWS Provider `6.23.0`
- Kubernetes Provider `3.0.0`
- Helm Provider `3.1.1`
- AWS CLI autenticado para executar `aws eks get-token`

## Exemplo de uso
```hcl
module "eks" {
  source = "./"

  project_name = "meu-projeto"
  region       = "us-east-1"
  cidr_block   = "10.0.0.0/16"

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }

  cluster_version = "1.31"

  endpoint_private_access      = true
  endpoint_public_access       = false
  endpoint_public_access_cidrs = []

  node_instance_types = ["t3.large"]
  node_desired_size   = 2
  node_min_size       = 2
  node_max_size       = 4

  alb_controller_chart_version = "1.12.0"
}
```

## Segurança (defaults)
- `endpoint_public_access = false`
- `endpoint_private_access = true`
- Se `endpoint_public_access = true`, defina CIDRs em `endpoint_public_access_cidrs`.

## Inputs (root)
| Nome | Tipo | Default | Descrição |
|------|------|---------|-----------|
| `project_name` | `string` | n/a | Nome base dos recursos |
| `region` | `string` | n/a | Região AWS |
| `cidr_block` | `string` | n/a | CIDR da VPC |
| `tags` | `map(any)` | n/a | Tags comuns |
| `endpoint_private_access` | `bool` | `true` | Endpoint privado da API EKS |
| `endpoint_public_access` | `bool` | `false` | Endpoint público da API EKS |
| `endpoint_public_access_cidrs` | `list(string)` | `[]` | CIDRs permitidos no endpoint público |
| `cluster_version` | `string` | `"1.31"` | Versão do Kubernetes no EKS |
| `enabled_cluster_log_types` | `list(string)` | `["api", "audit", "authenticator"]` | Logs de controle EKS |
| `cluster_addons` | `list(string)` | `["coredns", "kube-proxy", "vpc-cni"]` | Addons gerenciados |
| `cluster_addon_versions` | `map(string)` | `{}` | Versões dos addons por nome |
| `node_desired_size` | `number` | `2` | Desired do node group |
| `node_min_size` | `number` | `2` | Mínimo do node group |
| `node_max_size` | `number` | `4` | Máximo do node group |
| `node_instance_types` | `list(string)` | `["t3.medium"]` | Tipos de instância dos nodes |
| `node_capacity_type` | `string` | `"ON_DEMAND"` | `ON_DEMAND` ou `SPOT` |
| `node_disk_size` | `number` | `20` | Disco dos nodes em GiB |
| `node_max_unavailable` | `number` | `1` | Max indisponíveis durante update |
| `alb_controller_chart_version` | `string` | `"1.12.0"` | Versão do chart do ALB Controller |

## Outputs (root)
| Nome | Descrição |
|------|-----------|
| `cluster_name` | Nome/ID do cluster EKS |
| `oidc` | Thumbprints do certificado OIDC |
| `oidc-identity` | URL do issuer OIDC do cluster |
| `subnet_pub_1a` | Subnet pública AZ-a |
| `subnet_pub_1b` | Subnet pública AZ-b |
| `subnet_priv_1a` | Subnet privada AZ-a |
| `subnet_priv_1b` | Subnet privada AZ-b |

## Fluxo recomendado
```bash
terraform init
terraform plan
terraform apply
```

## Automação da documentação
Use `terraform-docs` para manter os blocos `BEGIN_TF_DOCS/END_TF_DOCS` sincronizados com o código.

```bash
make docs
```

Validação de idempotência dos READMEs:

```bash
make docs-check
```

## Referência Terraform (Gerado)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.23.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.1.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_alb_controller"></a> [eks\_alb\_controller](#module\_eks\_alb\_controller) | ./modules/alb-controller | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |
| <a name="module_eks_nodegroup"></a> [eks\_nodegroup](#module\_eks\_nodegroup) | ./modules/nodegroup | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_controller_chart_version"></a> [alb\_controller\_chart\_version](#input\_alb\_controller\_chart\_version) | Versao do chart Helm do AWS Load Balancer Controller | `string` | `"1.12.0"` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Network VPC - CIDR Block | `string` | n/a | yes |
| <a name="input_cluster_addon_versions"></a> [cluster\_addon\_versions](#input\_cluster\_addon\_versions) | Versoes dos addons gerenciados do EKS por nome | `map(string)` | `{}` | no |
| <a name="input_cluster_addons"></a> [cluster\_addons](#input\_cluster\_addons) | Lista de addons gerenciados do EKS | `list(string)` | <pre>[<br/>  "coredns",<br/>  "kube-proxy",<br/>  "vpc-cni"<br/>]</pre> | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Versao do Kubernetes para o cluster EKS | `string` | `"1.31"` | no |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | Tipos de logs de controle habilitados no EKS | `list(string)` | <pre>[<br/>  "api",<br/>  "audit",<br/>  "authenticator"<br/>]</pre> | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Habilita endpoint privado da API do EKS | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Habilita endpoint público da API do EKS | `bool` | `false` | no |
| <a name="input_endpoint_public_access_cidrs"></a> [endpoint\_public\_access\_cidrs](#input\_endpoint\_public\_access\_cidrs) | Lista de CIDRs autorizados no endpoint público da API do EKS | `list(string)` | `[]` | no |
| <a name="input_node_capacity_type"></a> [node\_capacity\_type](#input\_node\_capacity\_type) | Tipo de capacidade do node group: ON\_DEMAND ou SPOT | `string` | `"ON_DEMAND"` | no |
| <a name="input_node_desired_size"></a> [node\_desired\_size](#input\_node\_desired\_size) | Quantidade desejada de nodes no node group | `number` | `2` | no |
| <a name="input_node_disk_size"></a> [node\_disk\_size](#input\_node\_disk\_size) | Tamanho do disco (GiB) por node no node group | `number` | `20` | no |
| <a name="input_node_instance_types"></a> [node\_instance\_types](#input\_node\_instance\_types) | Tipos de instancia EC2 para o node group | `list(string)` | <pre>[<br/>  "t3.medium"<br/>]</pre> | no |
| <a name="input_node_max_size"></a> [node\_max\_size](#input\_node\_max\_size) | Quantidade maxima de nodes no node group | `number` | `4` | no |
| <a name="input_node_max_unavailable"></a> [node\_max\_unavailable](#input\_node\_max\_unavailable) | Quantidade maxima de nodes indisponiveis durante update | `number` | `1` | no |
| <a name="input_node_min_size"></a> [node\_min\_size](#input\_node\_min\_size) | Quantidade minima de nodes no node group | `number` | `2` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do Projeto | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região da AWS onde serão criados os recursos | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | TAGs que serão adicionadas em todos os recursos | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
| <a name="output_oidc-identity"></a> [oidc-identity](#output\_oidc-identity) | n/a |
| <a name="output_subnet_priv_1a"></a> [subnet\_priv\_1a](#output\_subnet\_priv\_1a) | n/a |
| <a name="output_subnet_priv_1b"></a> [subnet\_priv\_1b](#output\_subnet\_priv\_1b) | n/a |
| <a name="output_subnet_pub_1a"></a> [subnet\_pub\_1a](#output\_subnet\_pub\_1a) | n/a |
| <a name="output_subnet_pub_1b"></a> [subnet\_pub\_1b](#output\_subnet\_pub\_1b) | n/a |
<!-- END_TF_DOCS -->
