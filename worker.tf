
# Azure Function App para procesamiento en segundo plano
resource "azurerm_service_plan" "workerplan" {
    name                = "sp-worker-${var.infra}-${var.project}-${var.environment}"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name            = "Y1"
    os_type             = "Linux"
    tags                = var.tags
}

resource "azurerm_linux_function_app" "worker" {
    name                       = "func-worker-${var.project}-${var.environment}"
    location                   = var.location
    resource_group_name        = azurerm_resource_group.rg.name
    service_plan_id            = azurerm_service_plan.workerplan.id
    storage_account_name       = azurerm_storage_account.saccount.name
    storage_account_access_key = azurerm_storage_account.saccount.primary_access_key

    site_config {
        application_stack {
        node_version = "22"
        }
    }

    tags = var.tags
}