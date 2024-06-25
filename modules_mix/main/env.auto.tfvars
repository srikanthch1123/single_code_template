# # client_name = "clt1"
# environment = "env"
# location    = "west europe"
# sku_name_splan_win = "P1v2" 
# /*
# F1                (Free),
# D1                (Shared),
# B1, B2, B3        (Basic Service Plan),
# S1, S2, S3        (Standard Service Plan),
# P1v2, P2v2, P3v2  (Premium v2 Service Plan)
# P0v3, P0v3, P1mv3, P2v3, P2mv3, P3v3, P3mv3, P4mv3, P5mv3 (Premium v3 Service Plan)
# I1, I2, I3        (Isolated Service Plan)
# I1v2, I2v2, I3v2, I4v2, I5v2, I6v2 (Isolated v2 Service Plan)
# */
# # resource_group_app_rg_name  = "rg-wwapp-${var.company_name}-${var.environment}-${var.location}-123"
# # service_plan_splan_win_name = "splan-wwapp-${var.company_name}-${var.environment}-${var.location}-123"
# # windows_web_app_name        = "wwapp-${var.company_name}-${var.environment}-${var.location}-123"
# resource_group_app_rg_name = "rg-wwapp-client-dev-westeurope-001"
# service_plan_splan_win_name = "splan-wwapp-client-dev-westeurope-001"
# windows_web_app_name = "wwapp-client-dev-westeurope-001"
# company_name = "hyd"

# ################################
# # storage account
# ################################

# resource_group_sa_name     = "rg-sa-client-dev-westeurope-001"

# storage_account_name    = "saclientdevweu001"


# ################################
# # Function app
# ################################

# windows_fapp_name = "fapp-client-dev-westeurope-001"

# # service_plan_id = "${module.app-service-windows.azurerm_service_plan.splan_win.id}"

# ################################
# # Cosmos DB
# ################################

# resource_group_name_cosmos_rg   = "rg-cosmos-client-dev-westeurope-001"
# cosmosdb_account_name           = "cosmos-client-dev-westeurope-001"

# ################################
# # Function app
# ################################s

# logic_app_standard_name         = "logicapp-client-dev-westeurope-001"

# app_service_plan_lapp           = "splan-lapp-client-dev-westeurope-001"

# ################################
# # app configuration
# ################################

# resource_group_name_appconfig_rg  = "rg-appconfig-client-dev-westeurope-001"
# app_configuration_name            = "appconfig-client-dev-westeurope-001"


# ################################
# # key vault
# ################################

# resource_group_name_kv            = "rg-kv-client-dev-westeurope-001"
# key_vault_name                    = "kv-client-dev-we-001"


# ################################
# # key vault
# ################################

# log_analytics_workspace_name      = "logalws-client-dev-westeurope-001"
# application_insights_name         = "appis-client-dev-westeurope-001"

# ################################
# # app service linux
# ################################

# sku_name_splan_lnx                = "P1v2"
# service_plan_splan_lnx_name       = "splan-lnxwapp-client-dev-westeurope-001"
# linux_web_app_name                = "lnxwapp-client-dev-westeurope-001"