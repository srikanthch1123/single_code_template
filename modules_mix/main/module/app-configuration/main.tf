data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_app_configuration" "appconfig" {
  name                = "appconfig-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "appconf_dataowner" {
  scope                = azurerm_app_configuration.appconfig.id
  role_definition_name = "App Configuration Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_app_configuration_key" "test" {
  configuration_store_id = azurerm_app_configuration.appconfig.id
  key                    = "appConfKey1"
  label                  = "somelabel"
  value                  = "a test"

  depends_on = [
    azurerm_role_assignment.appconf_dataowner
  ]
}