provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}
 
terraform {
  backend "azurerm" {}
}
 
resource "azurerm_resource_group" "demorg" {
  name     = "demo-rg"
  location = "Central US"
}
 
resource "azurerm_storage_account" "demosa" {
  name                     = "demostorageaccount"
  resource_group_name      = azurerm_resource_group.demorg.name
  location                 = azurerm_resource_group.demorg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}