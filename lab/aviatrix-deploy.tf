terraform {
    required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "3.0.0"
    }
  }
}
provider "aviatrix" {
  controller_ip = var.controller-ip
  username = var.controller_admin_username
  password = var.controller_admin_password  
}

resource "aviatrix_transit_gateway" "transit_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-hub
  vpc_id            = "${azurerm_virtual_network.hub-1-vnet.name}:${azurerm_resource_group.aviatrix-hub-rg.name}"
  subnet            = azurerm_subnet.hub-1-aviatrix-gateway-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "transit-gw-hub-1"
  allocate_new_eip  = true
  enable_bgp_over_lan = true
}

resource "aviatrix_spoke_gateway" "spoke_1_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-1
  vpc_id            = "${azurerm_virtual_network.spoke-1-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-1-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "spoke-gw-1"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_gateway" "spoke_2_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-2
  vpc_id            = "${azurerm_virtual_network.spoke-2-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-2-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "spoke-gw-2"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_gateway" "spoke_3_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-3
  vpc_id            = "${azurerm_virtual_network.spoke-3-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-3-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "spoke-gw-3"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_gateway" "spoke_4_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-4
  vpc_id            = "${azurerm_virtual_network.spoke-4-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-4-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "spoke-gw-4"
  allocate_new_eip  = true
}
