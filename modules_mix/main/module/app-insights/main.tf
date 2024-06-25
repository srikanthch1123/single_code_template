data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_log_analytics_workspace" "log_al_ws" {
  name                = "logalws-${var.company_name}-${var.environment}-${var.location}-123"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "app_is" {
  name                = "appis-${var.company_name}-${var.environment}-${var.location}-123"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.log_al_ws.id
  application_type    = "web"
}

output "instrumentation_key" {
  value = azurerm_application_insights.app_is.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.app_is.app_id
}