

param apiManagementServiceName string
param subscriptionName string
param productId string

resource user1 'Microsoft.ApiManagement/service/users@2020-06-01-preview' = {
  name: '${apiManagementServiceName}/apimuser1'
  properties: {
    firstName: 'User1'
    lastName: 'APIM'
    email: 'apim@microsoft.com'
    state: 'active'
    note: 'User note'
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
