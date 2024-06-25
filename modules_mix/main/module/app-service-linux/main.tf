data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_service_plan" "splan_lnx" {
  name                = "splan-lnxwapp-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  sku_name            = var.sku_name_splan_lnx
  os_type             = "Linux"
}

resource "azurerm_windows_web_app" "apps_lnx" {
  name                = "lnxwapp-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.splan_lnx.id

  site_config {}
}