# Specifies the provider configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  alias = "dev"
  region = var.REGION
  profile = "dev"
}

# #######################################################################################
# #SETUP OF PROVIDERS OF MULTI AWS ACCOUNTS
# # SPECIFIYING THE AZURE CLOUD PROVIDER
# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "=3.0.0"
#     }
#   }
# }
# # CONFIGURING AWS PROVIDERS & DIFFERENT ENV's & DIFF AWS ACCOUNTS
# provider "aws" {
#   alias = "dev"
#   region = ""
#   access_key = "" 
#   secret_key = ""
# }
# provider "aws" {
#   alias = "stage"
#   region = ""
#   access_key = ""
#   secret_key = ""
# }
# provider "aws" {
#   alias = "prod"
#   region = ""
#   access_key = ""
#   secret_key = ""
# }

# ####### CONFIGURING AZURE CLOUD PROVIDER #######
# provider "azurerm" {
#   alias = "dev"
#   features {}
#   subscription_id = ""
#   client_id = ""
#   client_secret = ""
#   tenant_id = ""
# }
# provider "azurerm" {
#   alias = "stage"
#   features {}
#   subscription_id = ""
#   client_id = ""
#   client_secret = ""
#   tenant_id = ""
# }
# provider "azurerm" {
#   alias = "prod"
#   features {}
#   subscription_id = ""
#   client_id = ""
#   client_secret = ""
#   tenant_id = ""
# }