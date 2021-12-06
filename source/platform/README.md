


### Deploy everything

```
az group create 'apimgitops-rg' -l westeurope
az deployment group create --resource-group 'apimgitops-rg'  --template-file .\platform.bicep
```