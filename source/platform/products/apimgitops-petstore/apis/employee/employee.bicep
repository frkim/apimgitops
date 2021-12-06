
param apiManagementServiceName string
param productName string

resource EmployeeAPI 'Microsoft.ApiManagement/service/apis@2021-04-01-preview' = {
  name: '${apiManagementServiceName}/EmployeeAPI'  
  properties: {
    format: 'openapi+json'
    value: loadTextContent('employee-swagger.json')
    path: 'employee'
    subscriptionRequired: true
    serviceUrl: 'https://apimgitops.azurewebsites.net/'
  }
}

resource EmployeeAPIWithProduct 'Microsoft.ApiManagement/service/products/apis@2021-04-01-preview' = {
  name: '${apiManagementServiceName}/${productName}/EmployeeAPI'
  dependsOn: [
    EmployeeAPI
  ]
}
