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