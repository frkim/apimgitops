
param apiManagementServiceName string
param productName string

resource petStoreApi 'Microsoft.ApiManagement/service/apis@2021-04-01-preview' = {
  name: '${apiManagementServiceName}/PetStore'  
/*
  properties: {
    format: 'swagger-link-json'
    value: 'http://petstore.swagger.io/v2/swagger.json'
    path: 'petstore'
    subscriptionRequired: true    
  }
*/
  properties: {
    format: 'swagger-json'
    value: loadTextContent('petstore-openapi.json')
    path: 'petstore'
    subscriptionRequired: false    
  }
}

resource petStoreApiWithProduct 'Microsoft.ApiManagement/service/products/apis@2021-04-01-preview' = {
  name: '${apiManagementServiceName}/${productName}/PetStore'
  dependsOn: [
    petStoreApi
  ]
}
