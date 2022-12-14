provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "aviatrix-controller-rg" {
  name     = var.hub-rg-name
  location = var.location-hub
 tags = {
    environment = "controller"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}