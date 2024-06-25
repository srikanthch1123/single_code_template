terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "modulesdemorg"
    storage_account_name = "moduledemostorage09"
    container_name       = "modulesdemo"
    key                  = "demo.terraform.tfstate"
  }
}

# terraform {
#   cloud {
#     organization = "tfinternal"

#     workspaces {
#       name = "Dev"
#     }
#   }
# }

provider "azurerm" {
  features {
    #  app_configuration {
    #   purge_soft_delete_on_destroy = true
    #   recover_soft_deleted         = true
  }
}