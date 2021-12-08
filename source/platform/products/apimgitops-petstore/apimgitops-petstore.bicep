
param apiManagementServiceName string

var productName = 'apimgitops-petstore'

resource apimgitopsPetStoreProduct 'Microsoft.ApiManagement/service/products@2020-06-01-preview' = {
  name: '${apiManagementServiceName}/${productName}'
  properties: {
    displayName: 'ApimGitOps Petstore Product'
    description: 'Apim GitOps Petstore API proxied to Petstore API online'
    terms: 'ApimGitOps PetStore Pet'
    subscriptionRequired: true
    approvalRequired: false
    subscriptionsLimit: 1
    state: 'published'    
  }
}

module subscriptions 'subscriptions/demoSubscriptions.bicep' = {
  name: 'apimgitops-petstore-subscription'
  params: {
    apiManagementServiceName: apiManagementServiceName
    productId: apimgitopsPetStoreProduct.id
    subscriptionName: 'apimgitops-petstore-subscription'
  }
}

module petstoreApi 'apis/petstore/petstore.bicep' = {
  name: 'petstore-api'
  dependsOn: [
    apimgitopsPetStoreProduct
  ]
  params: {
    apiManagementServiceName: apiManagementServiceName
    productName: productName
  }
}


