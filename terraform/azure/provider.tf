provider "random" {
}

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    random  = "3.1.2"
    azurerm = "3.1.0"
  }
  backend "azurerm" {
    container_name       = "tfstate"
    resource_group_name  = "TerraformTrainingBG"
    storage_account_name = "terraformtrainingbg"
    key                  = "dkrizic"
  }
}
