# IP Address Management

- [IP Address Management](#ip-address-management)
  - [Find Appropriate VM for my region](#find-appropriate-vm-for-my-region)
  - [Deploying the VM](#deploying-the-vm)
    - [Bicep Deployment](#bicep-deployment)
      - [Specifying Parameters in a Parameter File](#specifying-parameters-in-a-parameter-file)
      - [Specifying Parameters on the command line](#specifying-parameters-on-the-command-line)
  - [Building the Bicep file](#building-the-bicep-file)
  - [Cleaning Up Resources](#cleaning-up-resources)
    - [List all resources in the deployment](#list-all-resources-in-the-deployment)
    - [List all resources in the resource group](#list-all-resources-in-the-resource-group)
    - [Delete the deployment](#delete-the-deployment)

## Find Appropriate VM for my region

```shell
az vm image list \
  --publisher MicrosoftWindowsDesktop \
  --offer windows11 \
  --sku win11-22h2 \
  --location ukwest \
  --all \
  --output table
```

## Deploying the VM

I deployed the VM using the following commands:

Before the VM can be deployed, we need to create a resource group. I wish to use the resource group `net-fun-bootcamp`.

I had manually created the resource group `net-fun-bootcamp` in the Azure portal when deploying the VM.

Even though the VM has been deleted, the resource group `net-fun-bootcamp` might still exist.

We will check if the resource group exists:

```bash
az group exists --name net-fun-bootcamp
```

If it doesn't exist, create it:

```bash
az group create --name net-fun-bootcamp --location uksouth
```

Now we can deploy the VM:

```bash
cd projects/ip-address-management/templates/vm
```

To Deploy the VM using ARM Template:

```bash
az deployment group create \
  --resource-group net-fun-bootcamp \
  --template-file template.json \
  --parameters @parameters.json
```

### Bicep Deployment

To Deploy the VM using Bicep we can either use a parameter file or specify the parameters on the command line.

#### Specifying Parameters in a Parameter File

```bash
az deployment group create \
  --resource-group net-fun-bootcamp \
  --template-file template.bicep \
  --parameters @parameters.json \
  --name net-fun-windows-server
```

#### Specifying Parameters on the command line

```bash
az deployment group create \
  --resource-group net-fun-bootcamp \
  --template-file template.bicep \
  --parameters virtualMachines_net_fun_windows_server_name=net-fun-windows-server \
  --parameters adminUsername=azureuser \
  --parameters adminPassword=Password123! \
  --name net-fun-windows-server
```

The VM was deployed successfully and I can see it in the Azure portal.

## Building the Bicep file

After deploying the VM using Bicep. I tried to deploy the VM using the ARM template but received the following error.

```terminal
az deployment group create \
  --resource-group net-fun-bootcamp \
  --template-file template.json \
  --parameters @parameters.json
The content for this response was already consumed
```

This is because the ARM template is not up to date with the Bicep file. We can build the Bicep file to regenerate the ARM template.

```bash
az bicep build -f template.bicep
```

## Cleaning Up Resources

### List all resources in the deployment

az deployment group show \
  --resource-group net-fun-bootcamp \
  --name net-fun-windows-server

### List all resources in the resource group

az resource list \
  --resource-group net-fun-bootcamp

### Delete the deployment

To delete the VM and all its associated resources, use:

```bash
az vm delete \
  --resource-group net-fun-bootcamp \
  --name net-fun-windows-server \
  --yes
```

This will delete:

- The VM
- The managed disk (if configured with delete option)
- The network interface card (NIC)
- The public IP address

To verify the deletion:

```bash
# Check if VM exists
az vm show \
  --resource-group net-fun-bootcamp \
  --name net-fun-windows-server

# List remaining resources in the resource group
az resource list \
  --resource-group net-fun-bootcamp
```
