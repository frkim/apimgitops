
param apiManagementService string

resource policy 'Microsoft.ApiManagement/service/policies@2020-06-01-preview' = {
  name: '${apiManagementService}/policy'
  properties: {
    format: 'rawxml'
    value: loadTextContent('common.xml')
  }
}
