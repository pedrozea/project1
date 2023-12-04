# App Service

Summary describing the Bicep App Service Module.

App Service Bicep Module

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
namePrefix     | Yes      | AppService Name Prefix
location       | No       | Azure region to deploy
appServicePlanID | Yes      | ASP id
dockerImage    | No       | Docker image to deploy
dockerImageTag | No       | Reference the docker image tag

### namePrefix

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

AppService Name Prefix

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Azure region to deploy

- Default value: `[resourceGroup().location]`

### appServicePlanID

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

ASP id

### dockerImage

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Docker image to deploy

- Default value: `nginxdemos/hello`

### dockerImageTag

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Reference the docker image tag

- Default value: `latest`

## Outputs

Name | Type | Description
---- | ---- | -----------
webURL | string |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "modules/appService/appService.json"
    },
    "parameters": {
        "namePrefix": {
            "value": ""
        },
        "location": {
            "value": "[resourceGroup().location]"
        },
        "appServicePlanID": {
            "value": ""
        },
        "dockerImage": {
            "value": "nginxdemos/hello"
        },
        "dockerImageTag": {
            "value": "latest"
        }
    }
}
```

