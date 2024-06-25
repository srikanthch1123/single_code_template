# data "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   # location = var.location
# }

# resource "azurerm_data_factory" "adf" {
#   name                = "adf-${var.company_name}-${var.environment}-${var.location}-123"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   public_network_enabled = false
# }

# resource "azurerm_data_factory_linked_service_cosmosdb" "example" {
#   name             = "adf--ls-${var.company_name}-${var.environment}-${var.location}-123"
#   data_factory_id  = azurerm_data_factory.adf.id
#   # account_endpoint = azurerm_cosmosdb_account.database.endpoint
#   account_endpoint = module.cosmos-db.cosmosdb_endpoint
#   account_key      = module.cosmos-db.cosmosdb_primary_master_key
#   database         = module.cosmos-db.cosmosdb_name
# }