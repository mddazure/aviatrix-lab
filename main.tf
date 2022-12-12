provider "azurerm" {
  features {}
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
