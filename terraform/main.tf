resource "azurerm_resource_group" "sindhurg" {
  name     = "sindhu-rg"
  location = "centralus"
}

resource "azurerm_storage_account" "sindhusa" {
  name                     = "sindhusatftest"
  resource_group_name      = azurerm_resource_group.sindhurg.name
  location                 = azurerm_resource_group.sindhurg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_container_registry" "acr" {
  name                = "sindhuaciacr"
  resource_group_name = azurerm_resource_group.sindhurg.name
  location            = azurerm_resource_group.sindhurg.location
  sku                 = "Standard"
  admin_enabled       = true
}
