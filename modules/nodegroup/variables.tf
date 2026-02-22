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

  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.node_capacity_type)
    error_message = "node_capacity_type deve ser ON_DEMAND ou SPOT."
  }
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
