resource "azurerm_app_service_plan" "app_service_plan" {
  name                =  "${local.env_name}-aspn"
  location            = data.azurerm_resource_group.rgrp.location
  resource_group_name = data.azurerm_resource_group.rgrp.name

  sku {
    tier = "Free"
    size = "F1"
  }
}