provider "azurerm" {
  features {}
}


#######################################################################
## Create Resource Group
#######################################################################

resource "azurerm_resource_group" "aviatrix-spoke-rg" {
  name     = var.spoke-rg-name
  location = var.location-spoke-1
 tags = {
    environment = "spoke"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_resource_group" "aviatrix-hub-rg" {
  name     = var.hub-rg-name
  location = var.location-hub
 tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}