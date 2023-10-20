resource "azurerm_storage_account" "teststorage" {
  name                     = "teststorageforjagtik"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_storage_account" "teststorage2" {
  name                     = "teststorageforjagtik2"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_storage_container" "testcontainer" {
  name                  = "testcontainer"
  storage_account_name  = azurerm_storage_account.teststorage.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.teststorage]
}