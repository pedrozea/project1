//Common Parameters
//*********************************************************************

@description('AppService Name Prefix')
param namePrefix string

@description('Azure region to deploy')
param location string = resourceGroup().location

@description('ASP id')
param appServicePlanID string



//************************************************************************

// App Service Resource definition
//************************************************************************

resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
  name: '${namePrefix}-webapp'
  location: location
  properties: {
    serverFarmId: appServicePlanID
  }
}

output webURL string = webApplication.properties.hostNames[0]

//************************************************************************
