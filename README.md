# Sample GitHub Actions workflow to deploy Azure PaaS resources with Terraform

# Prerequisites

- Create an Azure Service Principal:<br>
<b>az ad sp create-for-rbac --name "TerraformSPN" --role Contributor --scopes /subscriptions/<subscription-id> --sdk-auth</b><br><br>
- Create an Azure Storage Account to store Terraform tfstagefile:<br>
<b>az group create -g RG-TFSTO-DEV -l northeurope<br>
az storage account create -n azstotf2021 -g RG-TFSTO-DEV -l northeurope --sku Standard_LRS<br>
 az storage container create -n terraform-state --account-name azstotf2021</b><br>
