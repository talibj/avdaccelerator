
resource routetables 'Microsoft.Network/routeTables@2021-05-01' = {
  name: 'rt-dev-eus-1'
  location: resourceGroup().location
}
