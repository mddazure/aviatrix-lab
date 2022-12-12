#######################################################################
## Create Bastion spoke-1
#######################################################################
resource "azurerm_public_ip" "bastion-spoke-1-pubip" {
  name                = "bastion-spoke-1-pubip"
  location            = var.location-spoke-1
  resource_group_name = spoke-rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-spoke-1" {
  name                = "bastion-spoke-1"
  location            = var.location-spoke-1
  resource_group_name = spoke-rg-name
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
## Create Bastion spoke-2
#######################################################################
resource "azurerm_public_ip" "bastion-spoke-2-pubip" {
  name                = "bastion-spoke-2-pubip"
  location            = var.location-spoke-2
  resource_group_name = spoke-rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-spoke-2" {
  name                = "bastion-spoke-2"
  location            = var.location-spoke-2
  resource_group_name = spoke-rg-name
  sku                 = "Standard"
  ip_connect_enabled =  true
  shareable_link_enabled = true

  ip_configuration {
    name                 = "bastion-spoke-2-configuration"
    subnet_id            = azurerm_subnet.bastion-spoke-2-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-spoke-2-pubip.id
  }
}
#######################################################################
## Create Bastion spoke-3
#######################################################################
resource "azurerm_public_ip" "bastion-spoke-3-pubip" {
  name                = "bastion-spoke-3-pubip"
  location            = var.location-spoke-3
  resource_group_name = spoke-rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-spoke-3" {
  name                = "bastion-spoke-3"
  location            = var.location-spoke-3
  resource_group_name = spoke-rg-name
  sku                 = "Standard"
  ip_connect_enabled =  true
  shareable_link_enabled = true

  ip_configuration {
    name                 = "bastion-spoke-3-configuration"
    subnet_id            = azurerm_subnet.bastion-spoke-3-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-spoke-3-pubip.id
  }
}
#######################################################################
## Create Bastion spoke-4
#######################################################################
resource "azurerm_public_ip" "bastion-spoke-4-pubip" {
  name                = "bastion-spoke-4-pubip"
  location            = var.location-spoke-4
  resource_group_name = spoke-rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-spoke-4" {
  name                = "bastion-spoke-4"
  location            = var.location-spoke-4
  resource_group_name = spoke-rg-name
  sku                 = "Standard"
  ip_connect_enabled =  true
  shareable_link_enabled = true

  ip_configuration {
    name                 = "bastion-spoke-4-configuration"
    subnet_id            = azurerm_subnet.bastion-spoke-4-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-spoke-4-pubip.id
  }
}
#######################################################################
## Create Bastion Hub
#######################################################################
resource "azurerm_public_ip" "bastion-hub-1-pubip" {
  name                = "bastion-hub-1-pubip"
  location            = var.location-hub
  resource_group_name = hub-rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-hub-1" {
  name                = "bastion-hub-1"
  location            = var.location-hub
  resource_group_name = hub-rg-name
  sku                 = "Standard"
  ip_connect_enabled =  true
  shareable_link_enabled = true

  ip_configuration {
    name                 = "bastion-hub-1-configuration"
    subnet_id            = azurerm_subnet.bastion-hub-1-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-hub-1-pubip.id
  }
}
