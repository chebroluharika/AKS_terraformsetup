# AKS_terraformsetup

Steps to setup infrastructure using terraform in Azure from console:

1. Download azure cli
2. Run `az login`
3. Run `az account set -s="<subscriptionid>"`
4. Run  `terraform init`
5. Run `terraform plan`
6. Run `terraform apply --auto-approve`


## Pre-requisites
terraform
Azure subscription having parallelized access feature in Azure DevOps pipelines
azure cli
A resource group and a storage account in Azure to store terraform state files should be created prior running devops pipeline
Install Terraform plugin in Azure DevOps from merchandise



## Steps
1. Create RG, storage account, blob container in Azure manually.
2. Give those values as backend values while configuring pipeline.
3. Run terraform-base/azure-pipeline.yml to create RG, storage account mentioned in terraform-base/main.tf.
4. Run terraform/azure-pipeline.yml to create ACR mentioned in terraform/main.tf.
5. Use ACR creds to configure Docker registry service connection.
6. Run terraform-aci/azure-pipeline.yml to push an image to ACR.
7. Run /azure-pipeline.yml to create ACI with an image mentioned in terraform-aci/main.tf.
