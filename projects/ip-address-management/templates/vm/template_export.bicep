param virtualMachines_net_fun_windows_server_name string = 'net-fun-windows-server'
param disks_net_fun_windows_server_OsDisk_1_cc494a0ac4184c4a9cf45f71d3ea845d_externalid string = '/subscriptions/a964c46c-2383-4126-b8c8-d4363f5d0d61/resourceGroups/net-fun-bootcamp/providers/Microsoft.Compute/disks/net-fun-windows-server_OsDisk_1_cc494a0ac4184c4a9cf45f71d3ea845d'
param networkInterfaces_net_fun_windows_server91_z1_externalid string = '/subscriptions/a964c46c-2383-4126-b8c8-d4363f5d0d61/resourceGroups/net-fun-bootcamp/providers/Microsoft.Network/networkInterfaces/net-fun-windows-server91_z1'

resource virtualMachines_net_fun_windows_server_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_net_fun_windows_server_name
  location: 'uksouth'
  zones: [
    '1'
  ]
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
          id: disks_net_fun_windows_server_OsDisk_1_cc494a0ac4184c4a9cf45f71d3ea845d_externalid
        }
        deleteOption: 'Delete'
        diskSizeGB: 127
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: 'net-fun-windows'
      adminUsername: 'azureuser'
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
      requireGuestProvisionSignal: true
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
          id: networkInterfaces_net_fun_windows_server91_z1_externalid
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}
