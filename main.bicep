// Common Parameters
// ************************************************************

@description('Base name that will be used to create the resources')
@maxLength(14)
param namePrefix string = 'demo1'

@description('Azure Region used to create the resources')
param location string = resourceGroup().location

@description('Docker image to deploy')
param dockerImage string = 'nginxdemos/hello'

@description('Reference the docker image tag')
param dockerImageTag string = 'latest'

// ***************************************************************

// Template definition
// ***************************************************************

module storage 'modules/storageAccount/main.bicep'= {
  name: '${namePrefix}storage'
  params:{
    storageName: namePrefix
    location: location
  }
}

module ASP 'modules/appServicePlan/main.bicep'= {
  name: '${namePrefix}-ASP'
  params:{
    namePrefix: namePrefix
    location: location
    kind: 'linux'
    sku:'B1'
  }
}

module appService 'modules/appService/main.bicep'= {
  name: '${namePrefix}-webapp'
  params:{
    appServicePlanID: ASP.outputs.appServicePlanID
    namePrefix: namePrefix
    location: location
    dockerImage: dockerImage
    dockerImageTag: dockerImageTag
  }
}

// ****************************************************************************

// OUTPUTS
// ***************************************************************************

output webURL string = appService.outputs.webURL

// ****************************************************************************
