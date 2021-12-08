
param apiManagementServiceName string

module apimgitopsPetstoreProduct 'apimgitops-petstore/apimgitops-petstore.bicep' = {
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
