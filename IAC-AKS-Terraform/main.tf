module "createrg" {
  source = "./resourcegroup"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "createstorageaccount" {
  source = "./storageaccount"
  resource_group_name = module.createrg.resourcegroupname
  resource_group_location = module.createrg.resourcegrouplocation
}