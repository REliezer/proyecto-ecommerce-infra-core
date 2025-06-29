# Servidor de SQL
resource "azurerm_mssql_server" "sqlserver" {
    name = "sqlserver-${ var.infra }-${ var.project }-${ var.environment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    version = "12.0"
    administrator_login = "sqladmin"
    administrator_login_password = var.admin_sql_password
    tags = var.tags
}

# Base de datos transaccional
resource "azurerm_mssql_database" "db" {
    name = "db-${ var.infra }-${ var.project }"
    server_id = azurerm_mssql_server.sqlserver.id
    sku_name = "S0"
    tags = var.tags
}