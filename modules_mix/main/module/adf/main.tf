data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

data "azurerm_cosmosdb_account" "cosmos" {
  name                = "cosmos-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_data_factory" "adf" {
  name                = "adf-${var.company_name}-${var.environment}-${var.location}-123"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  public_network_enabled = false
}

resource "azurerm_data_factory_linked_service_cosmosdb" "example" {
  name             = "adf--ls-${var.company_name}-${var.environment}-${var.location}-123"
  data_factory_id  = azurerm_data_factory.adf.id
  # account_endpoint = azurerm_cosmosdb_account.database.endpoint
  account_endpoint = data.azurerm_cosmosdb_account.cosmos.endpoint
  account_key      = data.azurerm_cosmosdb_account.cosmos.primary_key
  database         = data.azurerm_cosmosdb_account.cosmos.name
}