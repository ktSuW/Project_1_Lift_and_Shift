targetScope = 'subscription'
metadata comments = 'Template used to create a resource group.'

@description('(required) The name used for your resource group')
param resourceGroupName string

@description('(required) MS region into which to deploy this resource.')
param location string

@description('(optional) Tag to store the provided resource creation date.')
param tags_CreationDate string = ''

@description('(optional) Tag to indicate the environment to which this resource is attached. Allowed values: Dev, Test, Prod. Default: Dev.')
@allowed([
  'Dev'
  'Test'
  'Prod'
])
param tags_Environment string = 'Dev'

@description('(optional) Tag object to apply tags to the resource.')
param tags object = {
}

var tags_var = {
  CreationDate: tags_CreationDate
  Environment: tags_Environment
}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: (empty(tags) ? tags_var : tags)
}

output resourceId string = resourceGroup.id
