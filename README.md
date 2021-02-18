# Sample GitHub Actions workflow to deploy Azure PaaS resources with Terraform

#Prerequisites

- Create an Azure Service Principal: 
<b>az ad sp create-for-rbac --name "TerraformSPN" --role Contributor --scopes /subscriptions/<subscription-id> --sdk-auth</b>
- Create an Azure Storage Account to store Terraform tfstagefile
