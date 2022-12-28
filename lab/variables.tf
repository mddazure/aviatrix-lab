############ change to actual values displayed as output of controller deployment ##########
variable "controller-ip" {
  description   = "public ip of controller"
  default       = "20.16.97.252"
}
variable "copilot-ip" {
  description   = "public ip of copilot"
  default       = "20.16.98.1"
}
############################################################################################

variable "hub-rg-name" {
  type = string
  default = "aviatrix-hub-rg-2"
  }
variable "spoke-rg-name" {
  type = string
  default = "aviatrix-spoke-rg"
}
variable "location-hub" {
  description = "Location to deploy hub"
  type        = string
  default     = "Sweden Central"
  //default = "West Europe"
}
variable "location-spoke-1" {
  description = "Location to deploy spoke-1"
  type        = string
  default     = "Sweden Central"
  //default = "West Europe"
}
variable "location-spoke-2" {
  description = "Location to deploy spoke-2"
  type        = string
  default     = "Sweden Central"
  //default = "West Europe"
}
variable "location-spoke-3" {
  description = "Location to deploy spoke-3"
  type        = string
  //default     = "Sweden Central"
  default = "West Europe"
}
variable "location-spoke-4" {
  description = "Location to deploy spoke-4"
  type        = string
  //default     = "Sweden Central"
  default = "West Europe"
}
variable "location-hub-2" {
  description = "Location to deploy hub"
  type        = string
  default     = "East US"
  //default = "West Europe"
}
variable "location-spoke-21" {
  description = "Location to deploy spoke-1"
  type        = string
  default     = "East US"
  //default = "West Europe"
}
variable "location-spoke-22" {
  description = "Location to deploy spoke-2"
  type        = string
  default     = "East US"
  //default = "West Europe"
}
variable "location-spoke-23" {
  description = "Location to deploy spoke-3"
  type        = string
  //default     = "Sweden Central"
  default = "West US"
}
variable "location-spoke-24" {
  description = "Location to deploy spoke-4"
  type        = string
  //default     = "Sweden Central"
  default = "West US"
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
variable "controller_admin_username" {
  type        = string
  description = "Admin Username for the controller."
  default     = "admin"
}
variable "controller_admin_password" {
  type        = string
  description = "Admin Password for the controller."
  default     = "Nienke0405%"
}
variable "account-name"{
  description = "name of azure access account configured on controller"
  // default = "MdD_1_non_prod" //fdpo
  default = "Saros-Security" //sarosio
}