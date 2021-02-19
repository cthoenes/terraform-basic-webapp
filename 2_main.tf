# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
# Create Resource Group to Host the App Service Plan and App Service
# The Terraform internal name will be rg. To reference use azurerm_resource_group.rg.<Attribute>
# The Name will be created from the variables prefix and environment in variables.tf. It will start with rg- to indicate it is an Resource Group
# The location is set in the location variable in variables.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.prefix}-${var.environment}" 
  location = var.location
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan
# Create the App Service Plan to host the app
# The terraform internal name will be asp. To reference use azurerm_app_service_plan.asp.<Attribute>
# The Name will be created from the variables prefix and environment in variables.tf. It will start with asp- to indicate it is an App Service Plan
# Location an Resourcegroup will be references to the created resource group
resource "azurerm_app_service_plan" "asp" {
  name                = "asp-${var.prefix}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service
# Creates the actual App Service
# The terraform internal name will be webapp. To reference use azurerm_app_service.webapp.<Attribute>
# The Name will be created from the variables prefix and environment in variables.tf. It will start with web- to indicate it is an App Service
# Location an Resourcegroup will be references to the created resource group
# App Service Plan ID will reference to the create App Service Plan
# It will Add an App Setting contaning the Environment and also a Example SQL Connection String
resource "azurerm_app_service" "webapp" {
  name                = "web-${var.prefix}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    dotnet_framework_version = "v4.0"
    default_documents        = [ "index.html", "hostingstart.html" ]
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "Environment" = var.environment
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}