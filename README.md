# Project
This project is an example of using Github actions to deploy terraform code to azure.

## Prerequisites
- The Resource Group must already be present in Azure. **(e.g. COD-D-WestUS2-Terraform-RGRP)**
- The storage account **(e.g. coddterraformsa)** and container **(e.g. tfstate )** that will hold the tf state must also already exist within the resource group 