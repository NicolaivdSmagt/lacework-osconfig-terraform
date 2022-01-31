locals {
  gcp_project         = "MY_GCP_PROJECT"
  gcp_region          = "europe-west4"
  gcp_zone            = "europe-west4-a"
  gcp_service_account = "MY_SA_ROLE@MY_GCP_PROJECT.iam.gserviceaccount.com"
  gcp_compute_name    = "gcp-test-instance"
  gcp_compute_type    = "g1-small"
  lacework_serverurl  = "https://api.fra.lacework.net"
}
