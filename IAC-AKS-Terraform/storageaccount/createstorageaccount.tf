resource "azurerm_storage_account" "teststorage" {
  name                     = "teststgforjagtik${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = var.tags
}
resource "azurerm_storage_account" "teststorage2" {
  name                     = "teststgjagtik2${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = var.tags
}
resource "azurerm_storage_container" "testcontainer" {
  name                  = "testcontainer${var.environment}"
  storage_account_name  = azurerm_storage_account.teststorage.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.teststorage]
}