INSTRUCTIONS :

1. create an Azure Service Principal :

	#!/bin/bash

	# Variables
	service_principal_name="<name_of_service_principal>"
	role="Contributor"  # or any other role
	scope="/subscriptions/<subscription_id>"  # Replace <subscription_id> by ID of your Azure subscription

	# Creation of Service Principal
	echo "Creation of Service Principal '$service_principal_name'with the scope '$scope'..."

	az ad sp create-for-rbac --name "$service_principal_name" --role "$role" --scopes "$scope" --sdk-auth

	# Print informations
	echo "Service Principal créé avec succès."

after that necessary information (AppID or ClientID, password or ClientSecret and TenantID) are printed in a json format, copy and save them. You'll need these credentials in provider.tf file.

create the following files :
	- provider.tf
	- rg.tf
	- network.tf
	- compute.tf

Remember that you can use Azure Key Vault or Hashicorp Vault

Execute the following script in Azure Cloud Shell :
	# Check that your code is well-formatted
	terraform fmt

	# Check if the code is valid :
	terraform validate

	# Execute the following commands :
	terraform init
	terraform plan
	terraform apply

	...

Don't forget to destroy ressources created if they are no longer useful :

	terraform destroy




