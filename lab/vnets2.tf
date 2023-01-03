#######################################################################
## Create Virtual Network - Hub 2
#######################################################################
resource "azurerm_virtual_network" "hub-2-vnet" {
  name                = "hub-2-vnet"
  location            = var.location-hub-2
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  address_space       = ["10.20.0.0/16"]

  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Hub 2
#######################################################################
resource "azurerm_subnet" "hub-2-aviatrix-gateway-subnet" {
  name                 = "aviatrixGWSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-2-vnet.name
  address_prefixes       = ["10.20.0.0/24"]
}
resource "azurerm_subnet" "hub-2-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-2-vnet.name
  address_prefixes       = ["10.20.1.0/24"]
}
resource "azurerm_subnet" "bastion-hub-2-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-2-vnet.name
  address_prefixes       = ["10.20.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 21
#######################################################################
resource "azurerm_virtual_network" "spoke-21-vnet" {
  name                = "spoke-21-vnet"
  location            = var.location-spoke-21
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.21.0.0/16"]

  tags = {
    environment = "spoke-21"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 21
#######################################################################
resource "azurerm_subnet" "spoke-21-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-21-vnet.name
  address_prefixes       = ["10.21.0.0/24"]
}
resource "azurerm_subnet" "spoke-21-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-21-vnet.name
  address_prefixes       = ["10.21.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-21-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-21-vnet.name
  address_prefixes       = ["10.21.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 22
#######################################################################
resource "azurerm_virtual_network" "spoke-22-vnet" {
  name                = "spoke-22-vnet"
  location            = var.location-spoke-22
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.22.0.0/16"]

  tags = {
    environment = "spoke-22"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 22
#######################################################################
resource "azurerm_subnet" "spoke-22-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-22-vnet.name
  address_prefixes       = ["10.22.0.0/24"]
}
resource "azurerm_subnet" "spoke-22-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-22-vnet.name
  address_prefixes       = ["10.22.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-22-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-22-vnet.name
  address_prefixes       = ["10.22.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke23
#######################################################################
resource "azurerm_virtual_network" "spoke-23-vnet" {
  name                = "spoke-23-vnet"
  location            = var.location-spoke-23
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.23.0.0/16"]

  tags = {
    environment = "spoke-23"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 23
#######################################################################
resource "azurerm_subnet" "spoke-23-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-23-vnet.name
  address_prefixes       = ["10.23.0.0/24"]
}
resource "azurerm_subnet" "spoke-23-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-23-vnet.name
  address_prefixes       = ["10.23.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-23-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-23-vnet.name
  address_prefixes       = ["10.23.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 24
#######################################################################
resource "azurerm_virtual_network" "spoke-24-vnet" {
  name                = "spoke-24-vnet"
  location            = var.location-spoke-24
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.24.0.0/16"]

  tags = {
    environment = "spoke-24"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 24
#######################################################################
resource "azurerm_subnet" "spoke-24-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-24-vnet.name
  address_prefixes       = ["10.24.0.0/24"]
}
resource "azurerm_subnet" "spoke-24-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-24-vnet.name
  address_prefixes       = ["10.24.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-24-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-24-vnet.name
  address_prefixes       = ["10.24.2.0/24"]
}

#######################################################################
## Create Network Interface - Hub 2
#######################################################################
resource "azurerm_network_interface" "hub-2-nic" {
  name                 = "hub-2-nic"
  location             = var.location-hub-2
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "hub-2-ipconfig"
    subnet_id                     = azurerm_subnet.hub-2-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 21
#######################################################################
resource "azurerm_network_interface" "spoke-21-nic" {
  name                 = "spoke-21-nic"
  location             = var.location-spoke-21
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-21-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-21-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-21"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 22
#######################################################################
resource "azurerm_network_interface" "spoke-22-nic" {
  name                 = "spoke-22-nic"
  location             = var.location-spoke-22
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-22-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-22-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-22"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 23
#######################################################################
resource "azurerm_network_interface" "spoke-23-nic" {
  name                 = "spoke-23-nic"
  location             = var.location-spoke-23
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-23-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-23-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-23"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 24
#######################################################################
resource "azurerm_network_interface" "spoke-24-nic" {
  name                 = "spoke-24-nic"
  location             = var.location-spoke-24
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-24-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-24-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-24"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Virtual Machine hub-2
#######################################################################
resource "azurerm_windows_virtual_machine" "hub-2-vm" {
  name                  = "hub-2-vm"
  location              = var.location-hub-2
  resource_group_name   = azurerm_resource_group.aviatrix-hub-rg.name
  network_interface_ids = [azurerm_network_interface.hub-2-nic.id]
  size               = var.vmsize
  computer_name  = "hub-2-vm"
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
    name              = "hub-2-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "hub-2"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-hub-2-vm" {
    
  name                 = "install-iis-hub-2-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.hub-2-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername);powershell -ExecutionPolicy Unrestricted Invoke-WebRequest -Uri https://raw.githubusercontent.com/mddazure/aviatrix-lab/main/lab/loop.bat -OutFile 'C:\\Users\\AzureAdmin\\Desktop\\loop.bat'"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-21
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-21-vm" {
  name                  = "spoke-21-vm"
  location              = var.location-spoke-21
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-21-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-21-vm"
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
    name              = "spoke-21-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-21"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-21-vm" {
    
  name                 = "install-iis-spoke-21-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-21-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername);powershell -ExecutionPolicy Unrestricted Invoke-WebRequest -Uri https://raw.githubusercontent.com/mddazure/aviatrix-lab/main/lab/loop.bat -OutFile 'C:\\Users\\AzureAdmin\\Desktop\\loop.bat'"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-22
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-22-vm" {
  name                  = "spoke-22-vm"
  location              = var.location-spoke-22
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-22-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-22-vm"
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
    name              = "spoke-22-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-22-vm" {
    
  name                 = "install-iis-spoke-22-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-22-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername);powershell -ExecutionPolicy Unrestricted Invoke-WebRequest -Uri https://raw.githubusercontent.com/mddazure/aviatrix-lab/main/lab/loop.bat -OutFile 'C:\\Users\\AzureAdmin\\Desktop\\loop.bat'"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-23
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-23-vm" {
  name                  = "spoke-23-vm"
  location              = var.location-spoke-23
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-23-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-23-vm"
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
    name              = "spoke-23-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-23-vm" {
    
  name                 = "install-iis-spoke-23-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-23-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername);powershell -ExecutionPolicy Unrestricted Invoke-WebRequest -Uri https://raw.githubusercontent.com/mddazure/aviatrix-lab/main/lab/loop.bat -OutFile 'C:\\Users\\AzureAdmin\\Desktop\\loop.bat'"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-24
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-24-vm" {
  name                  = "spoke-24-vm"
  location              = var.location-spoke-24
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-24-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-24-vm"
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
    name              = "spoke-24-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-24"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-24-vm" {
    
  name                 = "install-iis-spoke-4-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-24-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"
    }
SETTINGS
}
