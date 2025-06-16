# Journal

## VPC Settings

I modified the setting used by Tim to create another VPC with the following settings as I had already deployed a VPC with `10.200.123.0/24`

VPC IPv4 CIDR Block: 10.200.200.0/24

## Proof Of Deployment

Resource map of the VPC deployed with CFN.

![image](https://github.com/user-attachments/assets/b0212227-6cfd-4193-829c-849805a17b24)

![image](https://github.com/user-attachments/assets/f2495322-2a09-4bb9-bf1c-2d2ca82c9fcd)

## Terraform

I also generated the equivalent Terraform code for the VPC and subnets.

### Terraform Installation

Taken from [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

sudo apt-add-repository "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install -y terraform

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update && sudo apt-get install -y terraform
```

The generated plan has been stored in the [plan.tfplan](../projects/env_automation/terraform/plan.tfplan) file.