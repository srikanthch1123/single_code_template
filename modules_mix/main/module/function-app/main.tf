data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

data "azurerm_storage_account" "storage" {
  name                     = "sa${var.environment}${var.location}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  # location                 = var.location
  # account_tier             = "Standard"
  # account_replication_type = "GRS"
}

data "azurerm_service_plan" "splan" {
  name = "splan-wwapp-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_windows_function_app" "fapp_windows" {
  name                          = "fapp-${var.company_name}-${var.environment}-${var.location}-123"
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  storage_account_name          = data.azurerm_storage_account.storage.name
  service_plan_id               = data.azurerm_service_plan.splan.id
  # storage_account_access_key = data.azurerm_storage_account.storageds.name.primary_access_key
  site_config {}
}