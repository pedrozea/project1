// Common Parameters
// *****************************************************************

@description('ASP Name Prefix')
param namePrefix string

@description('ASP Azure Region')
param location string = resourceGroup().location

@description('ASP sku')
param sku string = 'B1'

@description('ASP OS')
@allowed(['linux','windows'])
param kind string = 'linux'
//******************************************************************  

// App Service Plan resource definition
//******************************************************************

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: '${namePrefix}-ASP'
  location: location
  kind: kind
  sku:{
    name: sku
  }
}

output appServicePlanID string = appServicePlan.id

//******************************************************************
