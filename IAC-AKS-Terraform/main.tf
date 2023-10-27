// Create Resource Group
module "createrg" {
  source = "./resourcegroup"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  resource_group_tags = var.resource_group_tags
}

// Create Storage accounts
# module "createstorageaccount" {
#   source = "./storageaccount"
#   resource_group_name = module.createrg.resourcegroupname
#   resource_group_location = module.createrg.resourcegrouplocation
#   environment = var.environment
#   tags = module.createrg.resourcegrouptags
#   depends_on = [ module.createrg ]
# }

// Create AKS Cluster and dependency resources
module "akscluster" {
  source = "./akscluster"
  aks_cluster_name = var.aks_cluster_name
  log_analytics_workspace_name = var.log_analytics_workspace_name
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  resource_group_location = module.createrg.resourcegrouplocation
  resource_group_name = module.createrg.resourcegroupname
  resource_group_tags = module.createrg.resourcegrouptags
  environment = var.environment
  depends_on = [ module.createrg ]
}