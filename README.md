# Sample GitHub Actions workflow to deploy Azure PaaS resources with Terraform

# Prerequisites

- Create an Azure Service Principal:<br>
<b>az ad sp create-for-rbac --name "TerraformSPN" --role Contributor --scopes /subscriptions/<subscription-id> --sdk-auth</b><br><br>

- Create an Azure Storage Account to store Terraform tfstate file:<br>
<b>az group create -g RG-TFSTO-DEV -l northeurope<br>
az storage account create -n azstotf2021 -g RG-TFSTO-DEV -l northeurope --sku Standard_LRS<br>
 az storage container create -n terraform-state --account-name azstotf2021</b><br><br>

- Create GitHub Secrets to securely pass SPN secrets and Azure information:<br>
<b>ARM_CLIENT_ID:</b> ${{secrets.SPN_ID}}<br>
<b>ARM_CLIENT_SECRET:</b> ${{secrets.SPN_PWD}}<br>
<b>ARM_SUBSCRIPTION_ID:</b> ${{secrets.AZURE_SUBSCRIPTIONID}}<br>
<b>ARM_TENANT_ID:</b> ${{secrets.AZURE_TENANTID}}<br>
