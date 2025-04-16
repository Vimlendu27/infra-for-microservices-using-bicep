param sqlServerName string
param location string
param adminUsername string
@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: adminUsername
    administratorLoginPassword: adminPassword
    version: '12.0'
  }
}

// Adding database
resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-05-01-preview' = {
  name: 'vimlendudb'
  parent: sqlServer
  location: location
  properties: {
    readScale: 'Disabled'
  }
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}
