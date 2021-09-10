# Project
This project is an example of using Github actions to deploy terraform code to azure.

## Prerequisites

### Azure
- The Resource Group must already be present in Azure. **(e.g. COD-D-WestUS2-Terraform-RGRP)**
- Create a Service Principal that has "Contributor" access to the resource group using powershell. 

    `az ad sp create-for-rbac --name "{ResourceGroup-SP" --sdk-auth --role Contributor --scopes /subscriptions/{SubId}/resourceGroups/{ResourceGroup} `

- The storage account **(e.g. coddterraformsa)** and container **(e.g. tfstate )** that will hold the tf state must also already exist within the resource group 

- Secrets: the following secrets must be added to your github environment.

  https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
  https://github.com/marketplace/actions/azure-login

  - ARM_CLIENT_ID : Guid 
  - ARM_CLIENT_SECRET : String
  - ARM_SUBSCRIPTION_ID : Guid
  - ARM_TENANT_ID : Guid
  - AZURE_CREDENTIALS : Json Object

  ``` 
  {
    "clientId": "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "clientSecret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "subscriptionId": "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "tenantId": "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
    "resourceManagerEndpointUrl": "https://management.azure.com/",
    "activeDirectoryGraphResourceId": "https://graph.windows.net/",
    "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
    "galleryEndpointUrl": "https://gallery.azure.com/",
    "managementEndpointUrl": "https://management.core.windows.net/"
  }`

- Azure Resource Providers - The service principal will not have contributor access at the subscription level so you will have to manually add the **Microsoft.DBforPostgreSQL** resource provider in your subscription.