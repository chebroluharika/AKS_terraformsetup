resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}
 
resource "azurerm_storage_account" "demosa" {
  name                     = "demostorageaccount"
  resource_group_name      = azurerm_resource_group.demorg.name
  location                 = azurerm_resource_group.demorg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


# resource "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   sku                 = "Standard"
#   admin_enabled       = true
# }

# data "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = var.rg_name
# }

# resource "azurerm_container_group" "aci" {
#   name                = "demoaci"
#   resource_group_name = var.rg_name
#   location            = var.location
#   ip_address_type     = "public"
#   dns_name_label      = "demoaci"
#   os_type             = "Linux"

#   image_registry_credential {
#     username = data.azurerm_container_registry.acr.admin_username
#     password = data.azurerm_container_registry.acr.admin_password
#     server   = data.azurerm_container_registry.acr.login_server
#   }

#   container {
#     name   = "demo"
#     image  = "${data.azurerm_container_registry.acr.login_server}/aci:${var.build_id}"
#     cpu    = "0.5"
#     memory = "1.5"

#     ports {
#       port     = 80
#       protocol = "TCP"
#     }
#   }
# }