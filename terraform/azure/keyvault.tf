data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  location            = local.location
  name                = local.keyvault.name
  resource_group_name = azurerm_resource_group.resource_group.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  access_policy {
    object_id = data.azurerm_client_config.current.object_id
    tenant_id = data.azurerm_client_config.current.tenant_id
    secret_permissions = ["Get", "Delete", "List", "Set", "Purge"]
  }
}

resource "azurerm_key_vault_secret" "acr_hostname" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name = local.keyvault.acr.hostname
  value = azurerm_container_registry.dkriziccr.login_server
}

resource "azurerm_key_vault_secret" "acr_username" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name = local.keyvault.acr.username
  value = azurerm_container_registry.dkriziccr.admin_username
}

resource "azurerm_key_vault_secret" "acr_password" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name = local.keyvault.acr.password
  value = azurerm_container_registry.dkriziccr.admin_password
}
