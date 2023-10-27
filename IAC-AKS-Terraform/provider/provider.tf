terraform {
  required_version = "~>1.6"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.76.0"
    }
    azuread = {
        source = "hashicorp/azuread"
        version = "~>2.44.1"
    }
    random = {
      source = "hashicorp/random"
      version = "~>3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    # resource_group {
    #   prevent_deletion_if_contains_resources = false
    # }
  }
}