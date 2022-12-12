terraform {
    required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "2.20.1"
    }
  }
}

provider "aviatrix" {
  controller_ip = azurerm_public_ip.aviatrix_controller_public_ip.ip_address
  username = var.controller_admin_username
  password = var.controller_admin_password  
}

#######################################################################
## Create Controller Public IP Address
#######################################################################
resource "azurerm_public_ip" "aviatrix_controller_public_ip" {
  allocation_method   = "Static"
  location            = var.location-hub
  name                = "${var.controller_name}-public-ip"
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
}
#######################################################################
## Create Controller NSG
#######################################################################
resource "azurerm_network_security_group" "aviatrix_controller_nsg" {
  location            = var.location-hub
  name                = "${var.controller_name}-security-group"
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "https"
    priority                   = "200"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefixes    = var.incoming_ssl_cidr
    destination_address_prefix = "*"
    description                = "https-for-vm-management"
  }
}
#######################################################################
## Create Controller NIC
#######################################################################
resource "azurerm_network_interface" "aviatrix_controller_nic" {
  location            = var.location-hub
  name                = "${var.controller_name}-network-interface-card"
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  ip_configuration {
    name                          = "${var.controller_name}-nic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.hub-1-aviatrix-controller-subnet.id
    public_ip_address_id          = azurerm_public_ip.aviatrix_controller_public_ip.id
  }
}
resource "azurerm_network_interface_security_group_association" "aviatrix_controller_nic_sg" {
  network_interface_id = azurerm_network_interface.aviatrix_controller_nic.id
  network_security_group_id = azurerm_network_security_group.aviatrix_controller_nsg.id
}

#######################################################################
## Create Controller VM
#######################################################################
resource "azurerm_linux_virtual_machine" "aviatrix_controller_vm" {
  admin_username                  = var.controller_virtual_machine_admin_username
  admin_password                  = var.controller_virtual_machine_admin_password
  name                            = "${var.controller_name}-vm"
  disable_password_authentication = false
  location                        = var.location-hub
  network_interface_ids = [
  azurerm_network_interface.aviatrix_controller_nic.id]
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  size                = var.controller_virtual_machine_size
  //disk
  os_disk {
    name                 = "aviatrix-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer     = "aviatrix-bundle-payg"
    publisher = "aviatrix-systems"
    sku       = "aviatrix-enterprise-bundle-byol"
    version   = "latest"
  }

  plan {
    name      = "aviatrix-enterprise-bundle-byol"
    product   = "aviatrix-bundle-payg"
    publisher = "aviatrix-systems"
  }
}
resource "aviatrix_transit_gateway" "transit_gw" {
  cloud_type        = 8
  account_name      = "MdD_1_non_prod"
  vpc_reg           = var.location-hub
  vpc_id            = azurerm_virtual_network.hub-1-vnet.id
  subnet            = azurerm_subnet.hub-1-aviatrix-gateway-subnet.address_prefixes
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
  subnet            = azurerm_subnet.spoke-1-aviatrix-subnet.address_prefixes
  gw_size           = "Standard_B1ms"
  gw_name           = "spoke-gw-1"
  allocate_new_eip  = true
}