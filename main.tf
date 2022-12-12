provider "azurerm" {
  features {}
}

terraform {
    required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "3.0.0"
    }
  }
}

provider "aviatrix" {
  controller_ip = azurerm_public_ip.aviatrix_controller_public_ip.ip_address
  username = var.controller_admin_username
  password = var.controller_admin_password  
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
module "aviatrix-deploy" {
  depends_on = [
    azurerm_public_ip.aviatrix_controller_public_ip
  ]
  source = "./aviatrix-deploy"
  }