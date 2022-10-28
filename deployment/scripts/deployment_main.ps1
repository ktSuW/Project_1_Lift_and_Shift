#====================== FILE LINKS =====================================
#------------- appService files links --------------
$appServiceTemplateFile = "deployment\bicep-templates\appService\appservice.windows.bicep"
$appServiceTemplateParameters = "deployment\bicep-templates\appService\appservice.windows.parameters.json"

#------------- appServicePlan template files links --------------
$appServiceTemplateFile = "deployment\bicep-templates\appServicePlan\appserviceplan.windows.bicep"
$appServiceTemplateParameters = "deployment\bicep-templates\appServicePlan\appserviceplan.windows.parameters.json"

#------------- AzureSQL template files links --------------
$azureSqlTemplateFile = "deployment\bicep-templates\AzureSQL\azureSql.bicep"
$azureSqlTemplateParameters = "deployment\bicep-templates\AzureSQL\azureSql.parameters.json"

#------------- Resource Group template files links --------------
$deploymentName = "Project1ToDoListDeployment"
$resourceGroupTemplateFile = "deployment\bicep-templates\resourceGroup\resourceGroup.bicep"
$resourceGroupTemplateParameters = "deployment\bicep-templates\resourceGroup\resourceGroup.parameters.json"

#====================== DEPLOYMENT =====================================
#------------- Deploy Resource Group --------------
az deployment sub create --location australiaeast --template-file $resourceGroupTemplateFile --parameters $resourceGroupTemplateParameters

# # Deploy AzureSQL database and Sql server 
# Question ????????????
# $resourceGroup = resourceGroup
az deployment sub create --location australiaeast --template-file $azureSqlTemplateFile --parameters $azureSqlTemplateParameters

