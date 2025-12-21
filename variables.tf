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
  type        = map
  description = "TAGs que serão adicionadas em todos os recursos"
}

