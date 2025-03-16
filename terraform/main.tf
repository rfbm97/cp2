terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# Definimos el provider
provider "azurerm" {
  features {}
}


# Creamos un grupo de recursos 

resource "azurerm_resource_group" "rg" {
  name     = var.name_of_resource_group
  location = var.location

  tags = {
    environment = "casopractico2"
  }
}

# Creamos una storage account 

resource "azurerm_storage_account" "stAccount" {
  name                     = var.name_of_storage_account
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "casopractico2"
  }
}
