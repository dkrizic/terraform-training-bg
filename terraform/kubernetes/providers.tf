provider "kubernetes" {

}

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = "3.10.0"
    kubernetes = "2.10.0"
  }
}
