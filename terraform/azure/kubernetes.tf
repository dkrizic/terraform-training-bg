resource "azurerm_resource_group" "resource_group" {
  location = local.location
  name     = local.resource_group_name
}

resource "azurerm_kubernetes_cluster" "kubernetes" {

  location            = local.location
  resource_group_name = azurerm_resource_group.resource_group.name
  kubernetes_version = "1.22.6"

  name = "DKrizic"
  dns_prefix = "dkrizicaks"

  default_node_pool {
    name                = "default"
    vm_size             = "Standard_D2_v2"
    enable_auto_scaling = true
    max_count           = 5
    min_count           = 1
  }

  identity {
    type = "SystemAssigned"
  }
}

/*
resource "azurerm_key_vault_secret" "kubernetes_client_certificate" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name      = "kubernetes-client-certificate"
  value     = azurerm_kubernetes_cluster.kubernetes.kube_admin_config.client_certificate
}
*/

resource "azurerm_key_vault_secret" "kubernetes_config_raw" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name      = "kubernetes-config-raw"
  value     = azurerm_kubernetes_cluster.kubernetes.kube_config_raw
}