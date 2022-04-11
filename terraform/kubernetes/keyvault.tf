data "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
}

data "azurerm_key_vault" "keyvault" {
  name                = local.keyvault.name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_key_vault_secret" "acr_hostname" {
  key_vault_id = data.azurerm_key_vault.keyvault.id
  name         = local.keyvault.acr.hostname
}

data "azurerm_key_vault_secret" "acr_username" {
  key_vault_id = data.azurerm_key_vault.keyvault.id
  name         = local.keyvault.acr.username
}

data "azurerm_key_vault_secret" "acr_password" {
  key_vault_id = data.azurerm_key_vault.keyvault.id
  name         = local.keyvault.acr.password
}
