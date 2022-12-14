variable "controller-rg-name" {
  type = string
  default = "aviatrix-controller-rg"
}
variable "location-controller" {
  description = "Location to deploy controller"
  type        = string
  //default     = "swedencentral"
default = "West Europe"
}