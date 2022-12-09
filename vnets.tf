#######################################################################
## Create Virtual Network - Hub 1
#######################################################################

resource "azurerm_virtual_network" "hub-1-vnet" {
  name                = "hub-1-vnet"
  location            = var.location-hub
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Subnets - Hub 1
#######################################################################
resource "azurerm_subnet" "hub-1-aviatrix-controller-subnet" {
  name                 = "aviatrixControllerSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "hub-1-aviatrix-gateway-subnet" {
  name                 = "aviatrixControllerSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "hub-1-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "bastion-hub-1-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 1
#######################################################################
resource "azurerm_virtual_network" "spoke-1-vnet" {
  name                = "spoke-1-vnet"
  location            = var.location-spoke-1
  resource_group_name = azurerm_resource_group.aviatrix-hub-rg.name
  address_space       = ["10.1.0.0/16"]

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Subnets - Spoke 1
#######################################################################
resource "azurerm_subnet" "spoke-1-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = ["10.1.0.0/24"]
}
resource "azurerm_subnet" "spoke-1-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = ["10.1.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-1-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = ["10.1.2.0/24"]
}
#######################################################################
## Create Network Interface - Hub 1
#######################################################################
resource "azurerm_network_interface" "hub-1-nic" {
  name                 = "hub-1-nic"
  location             = var.location-hub
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "hub-1-ipconfig"
    subnet_id                     = azurerm_subnet.hub-1-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 1
#######################################################################
resource "azurerm_network_interface" "spoke-1-nic" {
  name                 = "spoke-1-nic"
  location             = var.location-spoke-1
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-1-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-1-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Virtual Machine hub-1
#######################################################################
resource "azurerm_windows_virtual_machine" "hub-1-vm" {
  name                  = "hub-1-vm"
  location              = var.location-hub
  resource_group_name   = azurerm_resource_group.aviatrix-hub-rg.name
  network_interface_ids = [azurerm_network_interface.hub-1-nic.id]
  size               = var.vmsize
  computer_name  = "hub-1-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "hub-1-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}


#######################################################################
## Create Virtual Machine spoke-1
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-1-vm" {
  name                  = "spoke-1-vm"
  location              = var.location-spoke-1
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-1-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-1-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "spoke-1-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}