//Common Parameters
//*********************************************************************

@description('AppService Name Prefix')
param namePrefix string

@description('Azure region to deploy')
param location string = resourceGroup().location

@description('ASP id')
param appServicePlanID string

@description('Docker image to deploy')
param dockerImage string = 'nginxdemos/hello'

@description('Reference the docker image tag')
param dockerImageTag string = 'latest'

//************************************************************************

// App Service Resource definition
//************************************************************************

resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
  name: '${namePrefix}-webapp'
  location: location
  properties: {
    serverFarmId: appServicePlanID
    // Additional Web App configurations
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVICE_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
  }
}
}

output webURL string = webApplication.properties.hostNames[0]

//************************************************************************
