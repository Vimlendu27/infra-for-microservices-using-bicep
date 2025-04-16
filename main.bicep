targetScope = 'subscription'

param location string = 'poland'

// Resource Group
module rgModule './modules/rg/rg.bicep' = {
  name: 'rg-deploy'
  scope: subscription()
  params: {
    rgName: 'vimlendu'
    location: location
  }
}

// ACR
module acrModule './modules/acr/acr.bicep' = {
  name: 'acr-deploy'
  scope: resourceGroup('vimlendu')
  params: {
    acrName: 'vimlenduacr'
    location: location
  }
}
// AKS
module aksModule './modules/aks/aks.bicep' = {
  name: 'aks-deploy'
  scope: resourceGroup('vimlendu')
  params: {
    aksName: 'vimlenduaks'
    location: location
    dnsPrefix: 'vimlendu'
  }
}

// Key Vault
module kvModule './modules/keyvault/keyvault.bicep' = {
  name: 'kv-deploy'
  scope: resourceGroup('vimlendu')
  params: {
    keyVaultName: 'vimlendukeyvault'
    location: location
  }
}
// SQL Server
module sqlModule './modules/sql/sql.bicep' = {
  name: 'sql-deploy'
  scope: resourceGroup('vimlendu')
  params: {
    sqlServerName: 'vimlendusql'
    location: location
    adminUsername: 'sqladminuser'
    adminPassword: 'P@ssw0rd1234!' // In real projects, fetch from Key Vault
  }
}

// Storage Account
module storageModule './modules/storageaccount/storageaccount.bicep' = {
  name: 'storage-deploy'
  scope: resourceGroup('vimlendu')
  params: {
    storageAccountName: 'vimlendustorage'
    location: location
  }
}
