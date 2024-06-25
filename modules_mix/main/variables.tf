##########################
# common variables
##########################
variable "location" {
  default = "northeurope"
}

variable "company_name" {
  default = "clt1"
}
variable "environment" {
  default = "dev"
}

variable "resource_group_name" {
  default = "rg-clt1-dev-northeurope-001"
}

##########################
# app-service-windows
##########################

variable "sku_name_splan_win" {
  default = "B1"
}


##########################
# app-service-linux
##########################

variable "sku_name_splan_lnx" {
  default = "B1"
}

##########################
# app-configuration
##########################



##########################
# cosmos-db
##########################



################################
# storage account
################################


# variable "windows_fapp_name" {}

# variable "resource_group_sa_name" {}

# variable "storage_account_name" {}

# # variable "service_plan_id" {}




# variable "logic_app_standard_name" {}

# variable "app_service_plan_lapp" {}



# variable "key_vault_name" {}


# variable "Storage_create" {
#   default = "false"
# }