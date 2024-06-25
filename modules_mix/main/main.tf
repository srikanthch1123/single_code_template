module "resource-group" {
  source = "./module/resource-group"
  location = var.location
  resource_group_name    = var.resource_group_name
}

moved {
  from = azurerm_data_factory.adf
  to = module.adf.azurerm_data_factory.adf
}

moved {
  from = azurerm_data_factory_linked_service_cosmosdb.example
  to = module.adf.azurerm_data_factory_linked_service_cosmosdb.example
}

module "app-service-windows" {
  source                        = "./module/app-service-windows"
  location                      = var.location
  resource_group_name    = var.resource_group_name
  sku_name_splan_win            = var.sku_name_splan_win
  company_name                  = var.company_name
  environment                   = var.environment

  depends_on = [
    module.resource-group
  ]
}

module "storage-accounts" {
  # count                 = (var.Storage_create == "true" ? 1 : 0)
  source                = "./module/storage-accounts"
  location              = var.location
  environment           = var.environment
  resource_group_name   = var.resource_group_name

  depends_on = [
    module.resource-group
  ]
}

module "function-app" {
  source = "./module/function-app"
  location              = var.location
  environment           = var.environment
  company_name          = var.company_name
  resource_group_name   = var.resource_group_name


  depends_on = [
    module.app-service-windows,
    module.storage-accounts
  ]
}

module "cosmos-db" {
  source = "./module/cosmos-db"
  location              = var.location
  environment           = var.environment
  company_name          = var.company_name
  resource_group_name   = var.resource_group_name

  depends_on = [
    module.resource-group
  ]
}

module "adf" {
  source = "./module/adf"
  location              = var.location
  environment           = var.environment
  company_name          = var.company_name
  resource_group_name   = var.resource_group_name

  depends_on = [
    module.resource-group
  ]
}

# module "logic-app" {
#   source = "./module/logic-apps"
#   location              = var.location
#   environment           = var.environment
#   company_name          = var.company_name
#   resource_group_name   = var.resource_group_name

#   depends_on = [
#     module.app-service-windows,
#     module.storage-accounts
#   ]
# }

module "app-configuration" {
  source = "./module/app-configuration"
  resource_group_name   = var.resource_group_name
  location                          = var.location
  company_name                      = var.company_name
  environment                       = var.environment

  depends_on = [
    module.resource-group
  ]
}

# module "key-vault" {
#   source = "./module/key-vault"
#   resource_group_name   = var.resource_group_name
#   location                          = var.location
#   company_name                      = var.company_name
#   environment                       = var.environment

#   depends_on = [
#     module.resource-group
#   ]
# }

# module "app-insights" {
#   source = "./module/app-insights"
#   resource_group_name   = var.resource_group_name
#   location                          = var.location
#   company_name                      = var.company_name
#   environment                       = var.environment
  
#    depends_on = [
#     module.app-service-windows
#   ]
# }

# module "app-service-linux" {
#   source                        = "./module/app-service-linux"
#   resource_group_name   = var.resource_group_name
#   location                          = var.location
#   company_name                      = var.company_name
#   environment                       = var.environment
#   sku_name_splan_lnx            = var.sku_name_splan_lnx

#    depends_on = [
#     module.app-service-windows
#   ]
# }

# module "api-management" {
#   source                        = "./module/api-management"
#   resource_group_name           = var.resource_group_name
#   location                      = var.location
#   company_name                  = var.company_name
#   environment                   = var.environment
# }