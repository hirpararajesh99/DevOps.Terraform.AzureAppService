# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  //Visual Studio Enterprise Subscription – MPN  - Rajesh Hirpara  
}



//this will create resource group 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


//this will create app service plan
resource "azurerm_service_plan" "ASP" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "F1"

}

//this will create app app service in azure portal
resource "azurerm_app_service" "AppService" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.ASP.id
}


// this will create Store account 
resource "azurerm_storage_account" "SA" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account_pricing_tier
  account_replication_type = var.storage_account_account_replication_type
}

// this will create ms sql server
resource "azurerm_mssql_server" "MSSQLSERVER" {
  name                         = var.mssql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = var.mssql_server_version
  administrator_login          = var.mssql_server_admin_username
  administrator_login_password = var.mssql_server_admin_password
}

// this will create database in ms sql server
resource "azurerm_mssql_database" "mssqldb" {
  name           = var.mssql_server_databasename
  server_id      = azurerm_mssql_server.MSSQLSERVER.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.mssql_server_database_size
  read_scale     = var.mssql_server_database_read_scale
  sku_name       = var.mssql_server_database_pricing_tier
  zone_redundant = var.mssql_server_database_zone_redundant
  lifecycle {
    prevent_destroy = true
  }
}
