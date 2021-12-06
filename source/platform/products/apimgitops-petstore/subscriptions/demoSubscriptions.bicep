

param apiManagementServiceName string
param subscriptionName string
param productId string

resource moimUser 'Microsoft.ApiManagement/service/users@2020-06-01-preview' = {
  name: '${apiManagementServiceName}/moimhossain'
  properties: {
    firstName: 'Moim'
    lastName: 'Hossain'
    email: 'moimh.ossain@microsoft.com'
    state: 'active'
    note: 'Note for Moim Hossain'
  }
}

resource subscription1 'Microsoft.ApiManagement/service/subscriptions@2017-03-01' = {
  name: '${apiManagementServiceName}/${subscriptionName}'
  properties: {
    displayName: subscriptionName
    productId: productId
    userId: moimUser.id
  }
}
