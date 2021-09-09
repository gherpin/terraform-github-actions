locals {
  name         = "MyApplication"
  env_name     = "${local.name}-${var.environment}"
  subscription = "DEV"
}

#Load Resource Group with name passed into module, Resource Group Must already exist
data "azurerm_resource_group" "rgrp" {
  name = var.resource_group_name
}