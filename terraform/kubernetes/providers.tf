provider "kubernetes" {
  config_context = "DKrizic"
  config_path = "~/.kube/config"
}

provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    config_context = "DKrizic"
    config_path = "~/.kube/config"
  }
}

terraform {
  required_providers {
    azurerm    = "3.1.0"
    kubernetes = "2.10.0"
    helm       = "2.5.1"
  }
  backend "azurerm" {
    container_name       = "tfstate"
    resource_group_name  = "TerraformTrainingBG"
    storage_account_name = "terraformtrainingbg"
    key                  = "dkrizic-kubernetes"
  }
}
