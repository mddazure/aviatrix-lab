resource "aviatrix_transit_gateway" "transit_gw_2" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-hub-2
  vpc_id            = "${azurerm_virtual_network.hub-2-vnet.name}:${azurerm_resource_group.aviatrix-hub-rg.name}"
  subnet            = azurerm_subnet.hub-2-aviatrix-gateway-subnet.address_prefixes[0]
  gw_size           = "Standard_DS2_v2"
  gw_name           = "transit-gw-hub-2"
  allocate_new_eip  = true
  enable_bgp_over_lan = true
  bgp_lan_interfaces_count = 1
  connected_transit   = true
  enable_advertise_transit_cidr = true
  bgp_ecmp = true
  enable_segmentation = true
}

resource "aviatrix_spoke_gateway" "spoke_21_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-21
  vpc_id            = "${azurerm_virtual_network.spoke-21-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-21-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_DS2_v2"
  gw_name           = "spoke-gw-21"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_gateway" "spoke_22_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-22
  vpc_id            = "${azurerm_virtual_network.spoke-22-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-22-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_DS2_v2"
  gw_name           = "spoke-gw-22"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_gateway" "spoke_23_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-23
  vpc_id            = "${azurerm_virtual_network.spoke-23-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-23-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_DS2_v2"
  gw_name           = "spoke-gw-23"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_gateway" "spoke_24_gw" {
  cloud_type        = 8
  account_name      = var.account-name
  vpc_reg           = var.location-spoke-24
  vpc_id            = "${azurerm_virtual_network.spoke-24-vnet.name}:${azurerm_resource_group.aviatrix-spoke-rg.name}"
  subnet            = azurerm_subnet.spoke-24-aviatrix-subnet.address_prefixes[0]
  gw_size           = "Standard_DS2_v2"
  gw_name           = "spoke-gw-24"
  allocate_new_eip  = true
}
resource "aviatrix_spoke_transit_attachment" "spoke21-transit" {
  spoke_gw_name = aviatrix_spoke_gateway.spoke_21_gw.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit_gw_2.gw_name 
}
resource "aviatrix_spoke_transit_attachment" "spoke22-transit" {
  spoke_gw_name = aviatrix_spoke_gateway.spoke_22_gw.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit_gw_2.gw_name 
}
resource "aviatrix_spoke_transit_attachment" "spoke23-transit" {
  spoke_gw_name = aviatrix_spoke_gateway.spoke_23_gw.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit_gw_2.gw_name 
}
resource "aviatrix_spoke_transit_attachment" "spoke24-transit" {
  spoke_gw_name = aviatrix_spoke_gateway.spoke_24_gw.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit_gw_2.gw_name 
}
resource "aviatrix_transit_gateway_peering" "transit1-2"{
    transit_gateway_name1 = aviatrix_transit_gateway.transit_gw.gw_name
    transit_gateway_name2 = aviatrix_transit_gateway.transit_gw_2.gw_name
}
