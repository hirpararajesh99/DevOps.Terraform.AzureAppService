
variable "subscription_id" {
  type        = string
  default     = "b1bfc596-ccea-49d1-97cb-b50bc92b75dx"
  description = "Visual Studio Enterprise Subscription – MPN  - Rajesh Hirpara "

}



variable "resource_group_name" {
  type        = string
  default     = "MyTFResourceGroup"
  description = "hold the name of resource group"

}
variable "resource_group_location" {
  type        = string
  default     = "centralindia"
  description = "hold the location on which resource group need to create"

}
variable "app_service_plan" {
  type        = string
  default     = "MyTFAppServicePlan"
  description = "Name of App Service plan"

}

variable "app_service_name" {
  type        = string
  default     = "MyTFAppService"
  description = "Name of App Service"

}

variable "app_service_sku_tier" {
  type    = string
  default = "Free"
}
variable "app_service_sku_size" {
  type    = string
  default = "F1"
}

variable "storage_account_name" {
  type    = string
  default = "mytfstoreageaccount"
}
variable "storage_account_pricing_tier" {
  type        = string
  default     = "Standard"
  description = "there is a two option for pricing tier Standard, Premium"
  //Standard: Recommended for most scenarios (general-purpose v2 account)
  //Premium: Recommended for scenarios that require low latency.
}
variable "storage_account_account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Azure Storage redundancy there are several type like LRS,ZRS,GRS,RA GRS,GZRS,RA GZRS"
  //https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy
}
variable "mssql_server_name" {
  type        = string
  default     = "mytf-sqlserver"
  description = "Name of sql server"
}
variable "mssql_server_version" {
  type        = string
  default     = "12.0"
  description = "Version which you want to create sql server"
}
variable "mssql_server_admin_username" {
  type    = string
  default = "Rajesh"
}
variable "mssql_server_admin_password" {
  type    = string
  default = "KYqc4^^KJ65Zvzb^"
}
variable "mssql_server_databasename" {
  type    = string
  default = "mytfdatabase"
}

variable "mssql_server_database_size" {
  type        = number
  default     = 1
  description = "Database size in GB"
}

variable "mssql_server_database_pricing_tier" {
  type        = string
  default     = "S0"
  description = "Database pricing tier sku unit like S0,S1 in Gen1"
}

variable "mssql_server_database_read_scale" {
  type        = bool
  default     = false
  description = "this value depents on pricing and requiment"
}

variable "mssql_server_database_zone_redundant" {
  type        = bool
  default     = false
  description = "this value depents on pricing and requiment"
}

