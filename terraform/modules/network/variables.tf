variable "network_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "network_location" {
  description = "The location of the virtual network"
  type        = string
}

variable "network_rg" {
  description = "The resource group of the virtual network"
  type        = string
}