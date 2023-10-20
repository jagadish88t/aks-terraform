resource "azurerm_resource_group" "test_rg1" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
# resource "azurerm_storage_account" "teststorage" {
#   name                     = "teststorageforjagtik"
#   resource_group_name      = azurerm_resource_group.test_rg1.name
#   location                 = azurerm_resource_group.test_rg1.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }
# resource "azurerm_storage_account" "teststorage2" {
#   name                     = "teststorageforjagtik2"
#   resource_group_name      = azurerm_resource_group.test_rg1.name
#   location                 = azurerm_resource_group.test_rg1.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }
# resource "azurerm_storage_container" "testcontainer" {
#   name                  = "testcontainer"
#   storage_account_name  = azurerm_storage_account.teststorage.name
#   container_access_type = "private"
#   depends_on            = [azurerm_storage_account.teststorage]
# }