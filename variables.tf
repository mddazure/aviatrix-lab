variable "location-hub" {
  description = "Location to deploy hub"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
}

variable "location-spoke-1" {
  description = "Location to deploy spoke-1"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
}
variable "username" {
  description = "Username for Virtual Machines"
  type        = string
  default     = "AzureAdmin"
}

variable "password" {
  description = "Virtual Machine password, must meet Azure complexity requirements"
   type        = string
   default     = "Aviatrix-2022"
}
variable "vmsize" {
  description = "Size of the VMs"
  default     = "Standard_D2s_v3"
}

variable "controller_name" {
    description = "name of Aviatrix controller"
    default = "Controller"
  
}

variable "controller_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the controller virtual machine."
  default     = "aviatrix"
}

variable "controller_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the controller virtual machine."
  default     = "aviatrix1234!"
}

variable "controller_virtual_machine_size" {
  type        = string
  description = "Virtual Machine size for the controller."
  default     = "Standard_A4_v2"
}

variable "incoming_ssl_cidr" {
  type        = list(string)
  default = [ "217.121.0.0/16" ]
  description = "Incoming cidr for security group used by controller"
}
