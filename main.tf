resource "azurerm_resource_group" "mysql" {
  count    = var.resource_group_create ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_mysql_server" "server" {
  name                = "${var.name}-mysqlsvr"
  location            = var.location
  resource_group_name = var.resource_group_name

	sku_name   = var.sku_name

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
    auto_grow             = var.auto_grow
  }

  administrator_login          = var.admin_username
  administrator_login_password = var.password
  version                      = var.db_version
  ssl_enforcement              = var.ssl_enforcement
  tags                         = var.tags
}

resource "azurerm_mysql_database" "database" {
  for_each            = var.dbs

  name                = each.value.name
  charset             = lookup(each.value, "charset", var.db_charset)
  collation           = lookup(each.value, "collation", var.db_collation)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_mysql_firewall_rule" "firewall_rule" {
  for_each            = var.firewall_rules

  name                = each.key
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_mysql_virtual_network_rule" "vnet_rule" {
  for_each            = var.vnet_rules

  name                = each.key
  subnet_id           = each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_mysql_configuration" "config" {
  for_each            = var.mysql_configurations

  name                = each.key
  value               = each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}