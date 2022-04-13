resource "kubernetes_namespace" "backend" {
  metadata {
    name = "backend"
  }
}

resource "kubernetes_secret" "acr-pull" {
  metadata {
    name = "acr-pull"
    namespace = kubernetes_namespace.backend.id
  }
  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${data.azurerm_key_vault_secret.acr_hostname.value}" = {
          "username" = data.azurerm_key_vault_secret.acr_username.value
          "password" = data.azurerm_key_vault_secret.acr_password.value
          "email"    = "a@b.com"
          "auth"     = base64encode("${data.azurerm_key_vault_secret.acr_username.value}:${data.azurerm_key_vault_secret.acr_password.value}")
        }
      }
    })
  }
}
