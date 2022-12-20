#######################################################################
## Create Virtual Network - Controller
#######################################################################

resource "azurerm_virtual_network" "controller-vnet" {
  name                = "controller-vnet"
  location            = var.location-controller
  resource_group_name = var.controller-rg-name
  address_space       = ["10.100.0.0/16"]

  tags = {
    environment = "controller"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = 28862380
  }
}
#######################################################################
## Create Subnets - Controller
#######################################################################
resource "azurerm_subnet" "aviatrix-controller-subnet" {
  name                 = "aviatrixControllerSubnet"
  resource_group_name  = var.controller-rg-name
  virtual_network_name = azurerm_virtual_network.controller-vnet.name
  address_prefixes       = ["10.100.0.0/24"]
}
resource "azurerm_subnet" "controller-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = var.controller-rg-name
  virtual_network_name = azurerm_virtual_network.controller-vnet.name
  address_prefixes       = ["10.100.1.0/24"]
}
#######################################################################
## Create Controller Public IP Address
#######################################################################
resource "azurerm_public_ip" "aviatrix_controller_public_ip" {
  allocation_method   = "Static"
  location            = var.location-controller
  name                = "${var.controller_name}-public-ip"
  resource_group_name = var.controller-rg-name
}
#######################################################################
## Create Controller NSG
#######################################################################
resource "azurerm_network_security_group" "aviatrix_controller_nsg" {
  location            = var.location-controller
  name                = "${var.controller_name}-security-group"
  resource_group_name = var.controller-rg-name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "https"
    priority                   = "200"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix    =   "*"
    destination_address_prefix = "*"
    description                = "https-for-vm-management"
  }
}
#######################################################################
## Create Controller NIC
#######################################################################
resource "azurerm_network_interface" "aviatrix_controller_nic" {
  location            = var.location-controller
  name                = "${var.controller_name}-network-interface-card"
  resource_group_name = var.controller-rg-name
  ip_configuration {
    name                          = "${var.controller_name}-nic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.aviatrix-controller-subnet.id
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
  location                        = var.location-controller
  network_interface_ids = [
  azurerm_network_interface.aviatrix_controller_nic.id]
  resource_group_name = var.controller-rg-name
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
#######################################################################
## Create CoPilot Public IP Address
#######################################################################
resource "azurerm_public_ip" "aviatrix_copilot_public_ip" {
  allocation_method   = "Static"
  location            = var.location-controller
  name                = "${var.copilot_name}-public-ip"
  resource_group_name = var.controller-rg-name
}
#######################################################################
## Create CoPilot NSG
#######################################################################
resource "azurerm_network_security_group" "aviatrix_copilot_nsg" {
  location            = var.location-controller
  name                = "${var.copilot_name}-security-group"
  resource_group_name = var.controller-rg-name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "https"
    priority                   = "100"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix    =   "*"
    destination_address_prefix = "*"
    description                = "https-for-vm-management"
  }
    security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "udp"
    priority                   = "200"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_ranges    = ["5000","31283"]
    source_address_prefix    =   "*"
    destination_address_prefix = "*"
    description                = "udp 5000, 31283 in"
  }
}
#######################################################################
## Create CoPilot NIC
#######################################################################
resource "azurerm_network_interface" "aviatrix_copilot_nic" {
  location            = var.location-controller
  name                = "${var.copilot_name}-network-interface-card"
  resource_group_name = var.controller-rg-name
  ip_configuration {
    name                          = "${var.copilot_name}-nic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.aviatrix-controller-subnet.id
    public_ip_address_id          = azurerm_public_ip.aviatrix_copilot_public_ip.id
  }
}
resource "azurerm_network_interface_security_group_association" "aviatrix_copilot_nic_sg" {
  network_interface_id = azurerm_network_interface.aviatrix_copilot_nic.id
  network_security_group_id = azurerm_network_security_group.aviatrix_copilot_nsg.id
}

#######################################################################
## Create CoPilot VM
#######################################################################
resource "azurerm_linux_virtual_machine" "aviatrix_copilot_vm" {
  admin_username                  = var.controller_virtual_machine_admin_username
  admin_password                  = var.controller_virtual_machine_admin_password
  name                            = "${var.copilot_name}-vm"
  disable_password_authentication = false
  location                        = var.location-controller
  network_interface_ids = [
  azurerm_network_interface.aviatrix_copilot_nic.id]
  resource_group_name = var.controller-rg-name
  size                = var.controller_virtual_machine_size
  //disk
  os_disk {
    name                 = "aviatrix-copilot-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer     = "aviatrix-copilot"
    publisher = "aviatrix-systems"
    sku       = "avx-cplt-byol-01"
    version   = "latest"
  }

  plan {
    name      = "avx-cplt-byol-01"
    product   = "aviatrix-copilot"
    publisher = "aviatrix-systems"
  }
}