data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_service_plan" "splan_win" {
  name                = "splan-wwapp-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku_name            = var.sku_name_splan_win
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "apps_win" {
  name                = "wwapp-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = azurerm_service_plan.splan_win.location
  service_plan_id     = azurerm_service_plan.splan_win.id

  site_config {}
}