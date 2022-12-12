provider "azurerm" {
  features {}
}
variable "location-hub" {
  description = "Location to deploy hub"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
}
variable "location-spoke-1" {
  description = "Location to deploy spoke-1"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
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

module "azure-deploy" {
  source = "./azure"
  hub-rg-name = azurerm_resource_group.aviatrix-hub-rg.name
  spoke-rg-name = azurerm_resource_group.aviatrix-spoke-rg.name
}

module "aviatrix-deploy" {
  source = "./aviatrix"
  controller-ip = module.azure-deploy.controller-ip  
  hub-rg-name = azurerm_resource_group.aviatrix-hub-rg.name
  spoke-rg-name = azurerm_resource_group.aviatrix-spoke-rg.name
  }