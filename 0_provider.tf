# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {}
}


# https://www.terraform.io/docs/language/state/remote.html
# https://www.terraform.io/docs/language/state/index.html
# https://www.terraform.io/docs/language/settings/backends/index.html
# https://www.terraform.io/docs/language/settings/backends/azurerm.html
# Backend Configuration for Statemanegemet. Please refer to the Links.
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "<StorageAccountRG>"
#     storage_account_name = "<StorageAccountName>"
#     container_name       = "<BlobContainerName>" # for example "tfstate"
#     key                  = "dev.terraform.tfstate" # a name for the statefile to be generated
#   }
# }