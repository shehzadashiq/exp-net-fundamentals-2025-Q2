// Parameters
param virtualMachines_net_fun_windows_server_name string = 'net-fun-windows-server'
param adminUsername string
@secure()
param adminPassword string
param vnetAddressPrefix string = '10.0.0.0/16'
param subnetAddressPrefix string = '10.0.0.0/24'

// Create Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: 'net-fun-vnet'
  location: 'uksouth'
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }
}

// Create Public IP
resource publicIp 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${virtualMachines_net_fun_windows_server_name}-pip'
  location: 'uksouth'
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    idleTimeoutInMinutes: 4
  }
}

// Create a new NIC
resource nic 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${virtualMachines_net_fun_windows_server_name}-nic'
  location: 'uksouth'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIp.id
          }
          subnet: {
            id: vnet.properties.subnets[0].id
          }
        }
      }
    ]
  }
}

// Create the VM
// Create the VM
resource virtualMachines_net_fun_windows_server_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_net_fun_windows_server_name
  location: 'uksouth'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2025-datacenter-core-g2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Windows'
        name: '${virtualMachines_net_fun_windows_server_name}_OsDisk_1_cc494a0ac4184c4a9cf45f71d3ea845d'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
        deleteOption: 'Delete'
        diskSizeGB: 127
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: 'net-fun-windows'
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
          enableHotpatching: false
        }
      }
      secrets: []
      allowExtensionOperations: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
  }
}
