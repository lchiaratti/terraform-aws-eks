variable "cidr_block" {
  type        = string
  description = "Network VPC"
}

variable "project_name" {
  type        = string
  description = "Nome do Projeto"

}

variable "tags" {
  type        = map(any)
  description = "adicionar TAGs nos recursos"
}