# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet-hub" {
  name                = "${var.network_name}-vnet"
  resource_group_name = "${var.network_rg}"
  location            = "${var.network_location}"
  address_space       = ["10.0.0.0/16"]
}