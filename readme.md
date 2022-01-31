# OS Config Lacework Agent Deployment

This project provides example Terraform code that deploys a GCP compute instance and installs and configures the Lacework agent on it, using GCP's VM Manager (OS Config) policies.

## Pre Requisites

1. Instances need to support the OS Config agent and have it installed. The agent comes pre-installed on most modern public Linux images managed by Google (https://cloud.google.com/compute/docs/images/os-details#vm-manager).
2. Instances need network access to reach the Lacework package repo, and a service account attached that can call the OS Config and Container Analysis APIs.

## Install

1. Setup gcloud credentials in ~/.gcp/credentials.json.
2. Edit variables.tf to your liking.
3. Plan and apply.

## Files

variables.tf - Variables related to GCP subscription.  
provider.tf  - Initializes the Lacework and GCP providers.  
services.tf  - Enables the required Google APIs.  
lacework.tf  - Creates a Lacework agent access token.  
instance.tf  - Creates a Google compute instance, managed by OS Config.  
agent.tf     - Creates the OS Config policy that installs and configures the Lacework agent on the instance.  
