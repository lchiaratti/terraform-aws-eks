variable "cidr_block" {
  type        = string
  description = "Network VPC - CIDR Block"
}

variable "project_name" {
  type        = string
  description = "Nome do Projeto"
}

variable "region" {
  type        = string
  description = "Região da AWS onde serão criados os recursos"
}

variable "tags" {
  type        = map(any)
  description = "TAGs que serão adicionadas em todos os recursos"
}

variable "endpoint_private_access" {
  type        = bool
  description = "Habilita endpoint privado da API do EKS"
  default     = true
}

variable "endpoint_public_access" {
  type        = bool
  description = "Habilita endpoint público da API do EKS"
  default     = false
}

variable "endpoint_public_access_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs autorizados no endpoint público da API do EKS"
  default     = []
}

variable "cluster_version" {
  type        = string
  description = "Versao do Kubernetes para o cluster EKS"
  default     = "1.31"
}

variable "enabled_cluster_log_types" {
  type        = list(string)
  description = "Tipos de logs de controle habilitados no EKS"
  default     = ["api", "audit", "authenticator"]
}

variable "cluster_addons" {
  type        = list(string)
  description = "Lista de addons gerenciados do EKS"
  default     = ["coredns", "kube-proxy", "vpc-cni"]
}

variable "cluster_addon_versions" {
  type        = map(string)
  description = "Versoes dos addons gerenciados do EKS por nome"
  default     = {}
}

variable "node_desired_size" {
  type        = number
  description = "Quantidade desejada de nodes no node group"
  default     = 2
}

variable "node_min_size" {
  type        = number
  description = "Quantidade minima de nodes no node group"
  default     = 2
}

variable "node_max_size" {
  type        = number
  description = "Quantidade maxima de nodes no node group"
  default     = 4
}

variable "node_instance_types" {
  type        = list(string)
  description = "Tipos de instancia EC2 para o node group"
  default     = ["t3.medium"]
}

variable "node_capacity_type" {
  type        = string
  description = "Tipo de capacidade do node group: ON_DEMAND ou SPOT"
  default     = "ON_DEMAND"
}

variable "node_disk_size" {
  type        = number
  description = "Tamanho do disco (GiB) por node no node group"
  default     = 20
}

variable "node_max_unavailable" {
  type        = number
  description = "Quantidade maxima de nodes indisponiveis durante update"
  default     = 1
}

variable "alb_controller_chart_version" {
  type        = string
  description = "Versao do chart Helm do AWS Load Balancer Controller"
  default     = "1.12.0"
}
