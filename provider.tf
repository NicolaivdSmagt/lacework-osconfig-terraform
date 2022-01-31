provider "google" {
 credentials = file("~/.gcp/credentials.json")
 project     = "${local.gcp_project}"
 region      = "${local.gcp_region}"
}

provider "lacework" {
}
