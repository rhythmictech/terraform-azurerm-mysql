variable "resource_group_name" {
  description = "Default resource group name that the database will be created in."
  type        = string
  default     = "mysqlResourceGroup"
}

variable "resource_group_create" {
  description = "Set to false if the resource group already exists"
  type        = bool
  default     = true
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "name" {
  description = "The name of the server and resources to be created."
  type        = string
}

variable "admin_username" {
  description = "The administrator username of MySQL Server."
  type        = string
}

variable "password" {
  description = "The administrator password of the MySQL Server."
  type        = string
}

variable "db_version" {
  description = "Specifies the version of MySQL to use. Valid values are 5.6 and 5.7."
  type        = string
  default     = "5.7"
}

variable "ssl_enforcement" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enforced and Disabled."
  type        = string
  default     = "Enabled"
}

variable "sku_name" {
  description = "Specifies the SKU Name for this MySQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  type        = string
  default     = "B_Gen4_2"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  type        = number
  default     = 5120
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  type        = string
  default     = "Disabled"
}

variable "auto_grow" {
  description = "(Optional) Defines whether autogrow is enabled or disabled for the storage. Valid values are Enabled or Disabled."
  type        = string
  default     = "Enabled"
}


variable "charset" {
  description = "Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset."
  type        = string
  default     = "utf8"
}

variable "collation" {
  description = "Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation."
  type        = string
  default     = "utf8_unicode_ci"
}

variable "dbs" {
  description = "Map of databases to create, values supported: name, charset, collation"
  type        = map
  default     = {}
}

variable "firewall_rules" {
  description = "Map of firewall rules to create. Key is rule name, values are start_ip, end_ip"
  type        = map
  default     = {}
}

variable "vnet_rules" {
  description = "Map of vnet rules to create. Key is name, value is vnet id"
  type        = map
  default     = {}
}

variable "mysql_configurations" {
  description = "Map of MySQL configuration settings to create. Key is name, value is vnet id"
  type        = map
  default     = {}
}

variable "tags" {
  description = "Resource Tags."
  type        = map(string)
  default     = {}
}
