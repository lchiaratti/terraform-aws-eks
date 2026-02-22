module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
}

module "eks_cluster" {
  source                       = "./modules/cluster"
  project_name                 = var.project_name
  tags                         = var.tags
  private_subnet_1a            = module.eks_network.subnet_priv_1a
  private_subnet_1b            = module.eks_network.subnet_priv_1b
  cluster_version              = var.cluster_version
  endpoint_private_access      = var.endpoint_private_access
  endpoint_public_access       = var.endpoint_public_access
  endpoint_public_access_cidrs = var.endpoint_public_access_cidrs
  enabled_cluster_log_types    = var.enabled_cluster_log_types
  cluster_addons               = var.cluster_addons
  cluster_addon_versions       = var.cluster_addon_versions

}


module "eks_nodegroup" {
  source               = "./modules/nodegroup"
  project_name         = var.project_name
  tags                 = var.tags
  cluster_name         = module.eks_cluster.cluster_name
  private_subnet_1a    = module.eks_network.subnet_priv_1a
  private_subnet_1b    = module.eks_network.subnet_priv_1b
  node_desired_size    = var.node_desired_size
  node_min_size        = var.node_min_size
  node_max_size        = var.node_max_size
  node_instance_types  = var.node_instance_types
  node_capacity_type   = var.node_capacity_type
  node_disk_size       = var.node_disk_size
  node_max_unavailable = var.node_max_unavailable
}


module "eks_alb_controller" {
  source                       = "./modules/alb-controller"
  project_name                 = var.project_name
  tags                         = var.tags
  oidc-identity                = module.eks_cluster.oidc-identity
  cluster_name                 = module.eks_cluster.cluster_name
  alb_controller_chart_version = var.alb_controller_chart_version
}
