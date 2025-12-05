variable "project_name" {
  type        = string
  description = "Nome do Projeto"

}

variable "tags" {
  type        = map(any)
  description = "adicionar TAGs nos recursos"
}

variable "cluster_name" {
  type        = string
  description = "nome do cluster"

}

variable "private_subnet_1a" {
  type        = string
  description = "Subnet para o EKs cluster AZ 1a"

}

variable "private_subnet_1b" {
  type        = string
  description = "Subnet para o EKs cluster AZ 1b"

}