data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_key_vault" "kv" {
  name                        = "kv-${var.company_name}-${var.environment}-${var.location}"
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Import",
      "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update",
      "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
    ]

    secret_permissions = [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set",
    ]

    storage_permissions = [
      "Get", "Backup", "Delete", "DeleteSAS", "GetSAS", "List", "ListSAS", "Purge",
      "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update",
    ]
  }
}