// Common Parameters
// *********************************************************************

@description('Storage Name must have min 5 chars and a max of 24 chars')
@minLength(5)
@maxLength(14)
param storageName string

@description('Azure region for Storage Account')
param location string = resourceGroup().location

//***********************************************************************

// Storage Account Resource Definition
// **********************************************************************

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: '${storageName}storage'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties:{
    accessTier: 'Hot'
  }
}

// **********************************************************************
