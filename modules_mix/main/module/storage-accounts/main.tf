data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "sa${var.environment}${var.location}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}