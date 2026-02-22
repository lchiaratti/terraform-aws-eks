variable "project_name" {
  type        = string
  description = "Nome do Projeto"

}

variable "tags" {
  type        = map(any)
  description = "adicionar TAGs nos recursos"
}

variable "oidc-identity" {
  type        = string
  description = "HTTP url do OIDC provider - EKS Cluster"
}

variable "cluster_name" {
  type        = string
  description = "nome do cluster"
}

variable "alb_controller_chart_version" {
  type        = string
  description = "Versao do chart Helm do AWS Load Balancer Controller"
  default     = "1.12.0"
}
