provider "azurerm" {
  features {}
}

terraform {
    required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "2.20.1"
    }
  }
}

#######################################################################
## Create Resource Group
#######################################################################

resource "azurerm_resource_group" "aviatrix-spoke-rg" {
  name     = "aviatrix-spoke-rg"
  location = var.location-spoke-1
 tags = {
    environment = "spoke"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_resource_group" "aviatrix-hub-rg" {
  name     = "aviatrix-hub-rg"
  location = var.location-hub
 tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
