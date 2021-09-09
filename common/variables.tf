variable "resource_group_name" {
  description = "the Resource Group to create the service in"
  type = string
}

variable "location" {
  description = "the Azure region to create the service in"
  type = string
}

variable "environment" {
  description = "Up to 3 char identifier for the instance, dev, qa, stg, prd, etc."
  type = string
}
