data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}

resource "azurerm_api_management" "example" {
  name                = "apim-${var.company_name}-${var.environment}-${var.location}-123"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Developer_1"
}