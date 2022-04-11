data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  location            = local.location
  name                = "dkrizickv"
  resource_group_name = azurerm_resource_group.resource_group.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
}