
param apiManagementServiceName string = 'frkimapiops-dev'
param location string = resourceGroup().location

param sku string = 'Developer'
param skuCount int = 1

param resourceTags object = {
  Application: 'ApimGitops-API'
  CostCenter: 'Az-Sales'  
  Environment: 'Development'
  Owner: 'frkim@microsoft.com'
}


module apimService 'core/apim-service.bicep' = {
  name: 'apimservice'
  params: {
    apiManagementServiceName: apiManagementServiceName
    location: location
    sku: sku
    skuCount: skuCount
    resourceTags: resourceTags
  }
}


module servicePolicies 'policies/platform-policies.bicep' = {
  name: '${apimService.name}-service-policy'  
  params: {
    apiManagementService: apiManagementServiceName
  }  
}


module products 'products/products.bicep' = {
  name: 'products'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}
