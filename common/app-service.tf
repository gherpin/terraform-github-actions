resource "azurerm_app_service" "app_service" {
  name                =  "${local.env_name}"
  location            = data.azurerm_resource_group.rgrp.location
  resource_group_name = data.azurerm_resource_group.rgrp.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
}