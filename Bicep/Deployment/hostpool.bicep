param hostPoolName string
@allowed([
  'Pooled'
  'Personal'
])
param hostPoolType string
@allowed([
  'BreadthFirst'
  'DepthFirst'
])
param loadBalancer string
param maxSessions int = 4
param startVmOnConnect bool = true
param location string = resourceGroup().location
param time string = utcNow()

module hostpool '../Modules/hostPool.bicep' = {
  name: 'hostpool-${time}'
  params: {
    name: hostPoolName
    loadBalancerType: loadBalancer
    startVMOnConnect: startVmOnConnect
    hostpoolType: hostPoolType
    maxSessionLimit: hostPoolType == 'Pooled' ? maxSessions : 1
  }
}
