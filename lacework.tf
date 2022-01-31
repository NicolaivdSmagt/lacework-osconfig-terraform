terraform {                                                                                                                                                     
  required_providers {                                                                                                                                          
    lacework = {                                                                                                                                                
      source  = "lacework/lacework"                                                                                                                             
      version = "~> 0.14.0"                                                                                                                                     
    }                                                                                                                                                           
  }                                                                                                                                                             
}        

# Create an agent access token in Lacework

resource "lacework_agent_access_token" "osconfig_deployment" {
  name        = "osconfig-deployment"
  description = "Used to deploy agents using GCP OS Config"
}

