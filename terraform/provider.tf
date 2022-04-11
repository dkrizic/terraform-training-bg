provider "random" {
}

provider "azurerm" {
  features {}
  tenant_id       = local.tenant
  subscription_id = local.subscription
  client_id       = "f711b275-e843-46a1-8d35-6d771f50d562"
  client_secret   = var.client_secret
}

terraform {
  required_providers {
    random  = "3.1.2"
    azurerm = "3.1.0"
  }
}
