output "resourcegroupname" {
    value = azurerm_resource_group.test_rg1.name
}
output "resourcegrouplocation" {
  value = azurerm_resource_group.test_rg1.location
}
output "resourcegrouptags" {
  value = azurerm_resource_group.test_rg1.tags
}