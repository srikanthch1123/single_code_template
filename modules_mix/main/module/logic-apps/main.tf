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

resource "azurerm_app_service_plan" "splan_lapp" {
  name                = "splan-lapp-${var.company_name}-${var.environment}-${var.location}-123"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  kind                = "elastic"


  sku {
    tier = "WorkflowStandard"
    size = "WS1"
  }
}

resource "azurerm_logic_app_standard" "logic_app" {
  name                       = "logicapp-${var.company_name}-${var.environment}-${var.location}-123"
  location                   = data.azurerm_resource_group.rg.location
  resource_group_name        = data.azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.splan_lapp.id
  storage_account_name       = data.azurerm_storage_account.storage.name
  storage_account_access_key = data.azurerm_storage_account.storage.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "node"
    "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
  }
}