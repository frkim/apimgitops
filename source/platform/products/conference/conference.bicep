
param apiManagementServiceName string

var conferenceProductName = 'conferenceProduct'
var conferenceSubscriptionName = 'conferenceSubscription'

resource conferenceApi 'Microsoft.ApiManagement/service/apis@2021-04-01-preview' = {
  name: '${apiManagementServiceName}/Conference'  
  properties: {
    format: 'swagger-json'
    value: loadTextContent('conference-openapi.json')
    path: 'conference'
    subscriptionRequired: false
    description: 'Conference APIs'
  }
}


resource conferenceProduct 'Microsoft.ApiManagement/service/products@2020-06-01-preview' = {
  name: '${apiManagementServiceName}/${conferenceProductName}'
  properties: {
    displayName: 'Conference'
    subscriptionRequired: false
    state: 'published'    
  }
}

resource user2 'Microsoft.ApiManagement/service/users@2020-12-01' = {
  name: '${apiManagementServiceName}/apiuser2'
  properties: {
    firstName: 'Test'
    lastName: 'api-user2'
    email: 'apiuser2@microsoft.com'
    state: 'active'
  }
}

resource conferenceSub 'Microsoft.ApiManagement/service/subscriptions@2017-03-01' = {
  name: '${apiManagementServiceName}/${conferenceSubscriptionName}'
  properties: {
    displayName: 'Conference Subscription'
    productId: conferenceProduct.id
    userId: user2.id
  }
}

resource conferenceApiWithProduct 'Microsoft.ApiManagement/service/products/apis@2021-04-01-preview' = {
  parent: conferenceProduct
  name: 'Conference'
  dependsOn: [
    conferenceApi
  ]
}

