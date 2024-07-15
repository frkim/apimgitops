param apiManagementServiceName string
var petstoreProductName = 'PetStore'

resource petstoreProduct 'Microsoft.ApiManagement/service/products@2022-08-01' = {
  name: '${apiManagementServiceName}/${petstoreProductName}'
  properties: {
    displayName: 'Pet Store'
    subscriptionRequired: false
    state: 'published'    
  }
}

resource petStoreApi 'Microsoft.ApiManagement/service/products/apis@2022-08-01' = {
  name: '${apiManagementServiceName}/PetStoreApi'  
  properties: {
    format: 'openapi'
    value: loadTextContent('petstore-openapi.json')
    path: 'petstore'
    subscriptionRequired: false    
  }
}

