#######################################################################
## Create Bastion spoke-1
#######################################################################
resource "azurerm_public_ip" "bastion-spoke-1-pubip" {
  name                = "bastion-spoke-1-pubip"
  location            = var.location-spoke-1
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-spoke-1" {
  name                = "bastion-spoke-1"
  location            = var.location-spoke-1
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  sku                 = "Standard"
  ip_connect_enabled =  true
  shareable_link_enabled = true

  ip_configuration {
    name                 = "bastion-spoke-1-configuration"
    subnet_id            = azurerm_subnet.bastion-spoke-1-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-spoke-1-pubip.id
  }
}
#######################################################################
## Create Bastion Hub
#######################################################################
resource "azurerm_public_ip" "bastion-hub-pubip" {
  name                = "bastion-hub-1-pubip"
  location            = var.location-hub
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-spoke-2" {
  name                = "bastion-hub-1"
  location            = var.location-hub
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  sku                 = "Standard"
  ip_connect_enabled =  true
  shareable_link_enabled = true

  ip_configuration {
    name                 = "bastion-hub-1-configuration"
    subnet_id            = azurerm_subnet.bastion-hub-1-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-hub-1-pubip.id
  }
}
