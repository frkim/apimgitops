
param apiManagementServiceName string

module apimgitopsPetstoreProduct 'apimgitops-petstore/apimgitops-petstore.bicep' = {
  name: '${apiManagementServiceName}-product'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}
