provider "kubernetes" {
  config_context = "DKrizic"
  config_path = "~/.kube/config"
}

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm    = "3.1.0"
    kubernetes = "2.10.0"
  }
  backend "azurerm" {
    container_name       = "tfstate"
    resource_group_name  = "TerraformTrainingBG"
    storage_account_name = "terraformtrainingbg"
    key                  = "dkrizic-kubernetes"
  }
}
