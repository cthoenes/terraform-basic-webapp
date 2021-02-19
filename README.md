# Create a Basic Webapplication using Terraform

This respository is intended to be used as a quick start for Terraform. It deploys a very basic verion of an Web App.

## How to use (single User)

1. Log into Cloud Shell
2. Clone Repository
1. Change into the Directory
1. Initialize Terraform using <code>terraform init</code>
1. Plan the Terraform Deployment using <code>terraform plan</code>
1. Review the output. You will see that a Resource Group, App Service Plan and App Service will be created
1. To deploy the Resources use <code>terraform apply</code>
1. If you want to overwrite the default variable values use the tfvar file. Refer to the link to get more information about input variables. <code>terraform apply -var-file="prod.tfvars"</code>

## How to use (multiple User or pipelines)

1. Please review the Links about State Management and Backend in [0_provider.tf](/0_provider.tf)
1. Create Storage Account and Container to be used as backend
1. Uncomment an configure the backend in [0_provider.tf](/0_provider.tf)
