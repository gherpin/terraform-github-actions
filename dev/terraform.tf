terraform {
  required_version = ">= 1.0.5"

  backend "azurerm" {
    resource_group_name  = "COD-D-WestUS2-Terraform-RGRP"
    storage_account_name = "coddterraformsa"
    container_name       = "tfstate"
    key                  = "dev.WestUS2.Terraform.tfstate"
  }

  required_providers {
    azurerm = {
        # The "hashicorp" namespace is the new home for the HashiCorp-maintained
        # provider plugins.
        #
        # source is not required for the hashicorp/* namespace as a measure of
        # backward compatibility for commonly-used providers, but recommended for
        # explicitness.
        source  = "hashicorp/azurerm"
        version = "~> 2.41.0"
      }
  }
}

provider "azurerm" {
 features {}
}

module "common" {
  source = "../common"
  location                                    = "WestUS2"
  resource_group_name                         = "COD-D-WestUS2-Terraform-RGRP"
  environment                                 = "dev"
}