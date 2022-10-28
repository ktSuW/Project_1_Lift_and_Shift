metadata comments = 'Template used to create a app service for linux.'

@description('(required) app service plan name.')
@minLength(2)
param aspName string

@description('(required) Location for all resources.')
param location string = resourceGroup().location

@description('(optional) The SKU of App Service Plan.')
param sku string = 'F1'

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
var appServicePlanPortalName = 'asp-${aspName}'

resource appServicePlanPortal 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanPortalName
  location: location
  tags: (empty(tags) ? tags_var : tags)
  sku: {
    name: sku
  }
}