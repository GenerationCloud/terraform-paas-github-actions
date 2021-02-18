#Create an Azure PostGreSQL Server
resource "azurerm_postgresql_server" "PostGre1" {
  name                = "${var.postgre_name}-db"
  location            = "${var.postgre_location}"
  resource_group_name = "${var.postgre_rg}"

  administrator_login          = "${var.postgre_administrator_login}"
  administrator_login_password = "${var.postgre_administrator_login_password}"

  sku_name   = "${var.postgre_sku_name}"
  version    = "${var.postgre_version}"
  storage_mb = "${var.postgre_storage_mb}"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "PostGre1DB" {
  name                = "lvmdb"
  resource_group_name = "${var.postgre_rg}"
  server_name         = azurerm_postgresql_server.PostGre1.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "postgre_fqdn" {
    value = azurerm_postgresql_server.PostGre1.fqdn 
    description = "The FQDN of the PostgreSQL Server"
}