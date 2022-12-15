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
  account_name      = "MdD_1_non_prod"
  vpc_reg           = var.location-hub
  vpc_id            = azurerm_virtual_network.hub-1-vnet.id
  subnet            = azurerm_subnet.hub-1-aviatrix-gateway-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "transit-gw-hub-1"
  allocate_new_eip  = true
  enable_bgp_over_lan = true
}

resource "aviatrix_spoke_gateway" "spoke_1_gw" {
  cloud_type        = 8
  account_name      = "MdD_1_non_prod"
  vpc_reg           = var.location-spoke-1
  vpc_id            = azurerm_virtual_network.spoke-1-vnet.id
  subnet            = azurerm_subnet.spoke-1-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_B1ms"
  gw_name           = "spoke-gw-1"
  allocate_new_eip  = true
}
