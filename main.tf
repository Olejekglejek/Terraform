# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "my-rg" {
  name     = "azure-rg"
  location = "East Us"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_virtual_network" "my-vnet" {
  name                = "azure-vnet"
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    environment = "dev"
  }
}