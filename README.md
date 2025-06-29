# Infraestructura Base (Core) - Plataforma E-commerce

Este repositorio contiene los recursos base compartidos por toda la arquitectura de la plataforma de e-commerce.

## 🧱 Recursos implementados

- Resource Group principal
- Azure Storage Account con:
  - Contenedor Blob (`pictures`, `reports`)
  - Cola de mensajes (`tasks`)
- Azure SQL Server + base de datos transaccional
- Azure Function App para procesamiento en segundo plano

## ⚙️ Comandos para usar este módulo

```bash
terraform init
terraform plan -var-file="local.tfvars"
terraform apply -var-file="local.tfvars"
```

## 🧠 Notas importantes

- El Resource Group se comparte con los módulos `infra-apps` e `infra-analytics`.

---
