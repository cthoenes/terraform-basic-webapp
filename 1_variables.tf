# https://www.terraform.io/docs/language/values/variables.html
variable "prefix" {
    type = string
    description = "Prefix for Resources"
    default = "partsunlimited" # as example
}

# https://www.terraform.io/docs/language/values/variables.html
variable "location" {
  type = string
  description = "Azure Region to be used for resources."
  default = "West Europe" # as example. Overview: https://azure.microsoft.com/en-us/global-infrastructure/geographies/
}

# https://www.terraform.io/docs/language/values/variables.html
variable "environment" {
  type = string
  description = "Environment Identifier"
  default = "Developement" #to be used when developing IaC locally
}