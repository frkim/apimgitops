
param apiManagementServiceName string

module apimgitopsPetstoreProduct 'petstore/apis/petstore/petstore.bicep' = {
  name: '${apiManagementServiceName}-product'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}

module conferenceProduct 'conference/conference.bicep' = {
  name: '${apiManagementServiceName}-conferenceproduct'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}
