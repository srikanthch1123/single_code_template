output "cosmosdb_id" {
  description = "The CosmosDB Account ID."
  value       = azurerm_cosmosdb_account.cosmos.id
}

output "cosmosdb_name" {
  description = "The CosmosDB Account Name."
  value       = azurerm_cosmosdb_account.cosmos.name
}

output "cosmosdb_endpoint" {
  description = "The endpoint used to connect to the CosmosDB account."
  value       = azurerm_cosmosdb_account.cosmos.endpoint
}

output "cosmosdb_primary_master_key" {
  description = "The Primary master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.cosmos.primary_key
  sensitive   = true
}