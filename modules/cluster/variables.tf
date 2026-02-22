variable "project_name" {
  type        = string
  description = "Nome do Projeto"

}

variable "tags" {
  type        = map(any)
  description = "adicionar TAGs nos recursos"
}

variable "private_subnet_1a" {
  type        = string
  description = "Subnet privada para o EKs cluster AZ 1a"

}

variable "private_subnet_1b" {
  type        = string
  description = "Subnet privada para o EKs cluster AZ 1b"

}

variable "cluster_version" {
  type        = string
  description = "Versao do Kubernetes para o cluster EKS"
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

variable "enabled_cluster_log_types" {
  type        = list(string)
  description = "Tipos de logs de controle habilitados no EKS"
  default     = []
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
