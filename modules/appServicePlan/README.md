# App Service Plan

Summary describing the Bicep App Service Plan Module.

App Service Plan Bicep Module

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
namePrefix     | Yes      | ASP Name Prefix
location       | No       | ASP Azure Region
sku            | No       | ASP sku
kind           | No       | ASP OS

### namePrefix

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

ASP Name Prefix

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

ASP Azure Region

- Default value: `[resourceGroup().location]`

### sku

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

ASP sku

- Default value: `B1`

### kind

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

ASP OS

- Default value: `linux`

- Allowed values: `linux`, `windows`

## Outputs

Name | Type | Description
---- | ---- | -----------
appServicePlanID | string |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "main.json"
    },
    "parameters": {
        "namePrefix": {
            "value": ""
        },
        "location": {
            "value": "[resourceGroup().location]"
        },
        "sku": {
            "value": "B1"
        },
        "kind": {
            "value": "linux"
        }
    }
}
```

