terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.64.0" # Adjust this version as needed
    }
  }
}


provider "azurerm" {
  features {}
}