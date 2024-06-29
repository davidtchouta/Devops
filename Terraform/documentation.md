# Instructions

## Step 1: Create an Azure Service Principal

```bash
#!/bin/bash

# Variables
service_principal_name="<name_of_service_principal>"
role="Contributor"  # or any other role
scope="/subscriptions/<subscription_id>"  # Replace <subscription_id> by ID of your Azure subscription

# Creation of Service Principal
echo "Creation of Service Principal '$service_principal_name' with the scope '$scope'..."

az ad sp create-for-rbac --name "$service_principal_name" --role "$role" --scopes "$scope" --sdk-auth

# Print information
echo "Service Principal created successfully."

## Step 2: Create the Following Files

Create the following files in your project directory:

- `provider.tf`
- `rg.tf`
- `network.tf`
- `compute.tf`

## Step 3: Execute the Following Commands in Azure Cloud Shell

# Check that your code is well-formatted
terraform fmt

# Check if the code is valid
terraform validate

# Initialize Terraform
terraform init

# Plan Terraform deployment
terraform plan

# Apply Terraform deployment
terraform apply


## Step 4: Cleanup
terraform destroy

