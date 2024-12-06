@description('The name of the App Service Plan')
param appServicePlanName string

@description('The names of the web chatbot applications')
param appName string

@description('The Azure region where the resources will be deployed')
param location string = 'East US'

@description('The SKU for the App Service Plan')
param skuTier string = 'Basic'

@description('The size of the App Service Plan (e.g., B1, B2, B3)')
param skuSize string = 'B1'

@description('The capacity of App Service instances')
param skuCapacity int = 2

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    tier: skuTier
    name: skuSize
    capacity: skuCapacity
  }
  properties: {
    reserved: false // Set to true for Linux; false for Windows
  }
}

// Web Apps (Chatbot)
resource webApps 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
