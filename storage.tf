# Storage Account que contendrá Blob y Queue
resource "azurerm_storage_account" "saccount" {
    name = "sa${ lower(var.project) }${ var.environment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = var.tags
}

# Blob Container para imagenes
resource "azurerm_storage_container" "cpic" {
    name = "pictures"
    container_access_type =  "private"
    storage_account_id = azurerm_storage_account.saccount.id
}

# Blob Container para reportes
resource "azurerm_storage_container" "crep" {
    name = "reports"
    container_access_type =  "private"
    storage_account_id = azurerm_storage_account.saccount.id
}

# Queue Storage para tareas en segundo plano
resource "azurerm_storage_queue" "q1" {
    name = "tasks"
    storage_account_name = azurerm_storage_account.saccount.name
}