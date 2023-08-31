
param apiManagementServiceName string

module petstoreProduct 'petstore/apis/petstore/petstore.bicep' = {
  name: '${apiManagementServiceName}-petstoreproduct'  
  params: {
    apiManagementServiceName: apiManagementServiceName
    productName: 'Petstore'
  }  
}

module conferenceProduct 'conference/conference.bicep' = {
  name: '${apiManagementServiceName}-conferenceproduct'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}
