resource "azurerm_container_registry" "dkriziccr" {
  location            = local.location
  name                = "dkriziccr"
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "Basic"
}