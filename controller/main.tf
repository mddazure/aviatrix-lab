provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "aviatrix-controller-rg" {
  name     = var.controller-rg-name
  location = var.location-controller
 tags = {
    environment = "controller"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}