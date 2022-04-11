resource "kubernetes_namespace" "mywebapp" {
  metadata {
    name = "mywebapp"
  }
}

resource "kubernetes_secret" "test-pull" {
  metadata {
    name = "acr-pull"
    namespace = kubernetes_namespace.mywebapp.id
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
