terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.4.0" # Adjust this version as needed
    }
  }
}


provider "azurerm" {
  features {}
}