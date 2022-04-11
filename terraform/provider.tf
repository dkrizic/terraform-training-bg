provider "random" {
}

provider "azurerm" {
  features {}
  subscription_id = local.subscription
}

terraform {
  required_providers {
    random  = "3.1.2"
    azurerm = "3.1.0"
  }
}
