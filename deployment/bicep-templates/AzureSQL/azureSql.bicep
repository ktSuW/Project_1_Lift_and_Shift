@description('The name of the SQL logical server.')
param serverName string = uniqueString('sql', resourceGroup().id)

@description('The name of the SQL Database.')
param sqlDBName string = 'SampleDB'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param sqladministratorLogin string

@description('The administrator password of the SQL logical server.')
@secure()
param sqladministratorLoginPassword string

@description('Specifies the number of Azure sql database.')
@minValue(2)
@maxValue(100)
param sqlDbCount int = 2
param sqlDbNameSKUName string
param sqlDBNameSKUtier string

resource server 'Microsoft.Sql/servers@2021-08-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: sqladministratorLogin
    administratorLoginPassword: sqladministratorLoginPassword
  }
}

@batchSize(1)
resource serverName_sqlDBName_dbCopy_1 'Microsoft.Sql/servers/databases@2021-08-01-preview' = [for i in range(0, sqlDbCount): {
  name: '${serverName}/${sqlDBName}${(i + 1)}'
  location: location
  properties: {
  }
  sku: {
    name: sqlDbNameSKUName
    tier: sqlDBNameSKUtier
  }
  dependsOn: [
    server
  ]
}]