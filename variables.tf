variable "subscription_id" {
    type        = string
    description = "The Azure subscription ID"  
}

variable "location" {
    type        = string
    description = "The Azure region where resources will be deployed"
    default     = "Central US"
}

variable "project" {
    type        = string
    description = "The name of the project"
    default     = "ecommerceproject"
}

variable "environment" {
    type        = string
    description = "The environment for the deployment (e.g., dev, test, prod)"
    default     = "dev"  
}

variable "infra" {
    type        = string
    description = "Define el nombre de la infraestructura."
    default     = "core" 
}

variable "tags" {
    type        = map(string)
    description = "A map of tags to assign to resources"
    default     = {
        environment = "development"
        date        = "jun-2025"
        createdBy   = "Terraform"
    }
}

variable "admin_sql_password" {
    type = string
    description = "The password for the SQL account"
}

