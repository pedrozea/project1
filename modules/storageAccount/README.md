# Storage Account

Summary describing the Bicep Storage Account Module.

Storage Account Bicep Module

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
storageName    | Yes      | Storage Name must have min 5 chars and a max of 24 chars
location       | No       | Azure region for Storage Account

### storageName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Storage Name must have min 5 chars and a max of 24 chars

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Azure region for Storage Account

- Default value: `[resourceGroup().location]`

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
        "storageName": {
            "value": ""
        },
        "location": {
            "value": "[resourceGroup().location]"
        }
    }
}
```

