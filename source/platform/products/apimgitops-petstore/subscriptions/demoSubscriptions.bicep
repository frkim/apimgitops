

param apiManagementServiceName string
param subscriptionName string
param productId string

resource user1 'Microsoft.ApiManagement/service/users@2020-06-01-preview' = {
  name: '${apiManagementServiceName}/apiuser1'
  properties: {
    firstName: 'Test'
    lastName: 'api-user1'
    email: 'apiuser@microsoft.com'
    state: 'active'
  }
}

resource subscription1 'Microsoft.ApiManagement/service/subscriptions@2017-03-01' = {
  name: '${apiManagementServiceName}/${subscriptionName}'
  properties: {
    displayName: subscriptionName
    productId: productId
    userId: user1.id
  }
}
