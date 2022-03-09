
param apiManagementServiceName string
param location string = resourceGroup().location

param publisherEmail string = 'apim@microsoft.com'
param publisherName string = 'ApimGitops Inc.'
param sku string
param skuCount int

param resourceTags object 

resource apiManagementService 'Microsoft.ApiManagement/service@2020-12-01' = {
  name: apiManagementServiceName
  sku: {
    name: sku
    capacity: skuCount
  }
  properties: {
    publisherName: publisherName
    publisherEmail: publisherEmail
  }
  tags: resourceTags
}

// Create Application Insights
resource appInsightsApim 'Microsoft.Insights/components@2020-02-02' = {
  name: 'AppInsightsApim2021'
  location: '${resourceGroup().location}'
  kind: 'web'
  properties:{
    Application_Type:'web'
  }
}

// Create Logger and link logger
resource apimLogger 'Microsoft.ApiManagement/service/loggers@2019-12-01' = {
  name: '${apiManagementService.name}/${apiManagementService.name}-logger'
  properties:{
    resourceId: '${appInsightsApim.id}'
    loggerType: 'applicationInsights'
    credentials:{
      instrumentationKey: '${appInsightsApim.properties.InstrumentationKey}'
    }
  }
}
