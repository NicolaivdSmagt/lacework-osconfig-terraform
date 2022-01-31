# Enable Google OS Config API

resource "google_project_service" "gcp-osconfig-api" {
  project = "${local.gcp_project}"
  service = "osconfig.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services = true
}

# Enable Google Container Analysis API

resource "google_project_service" "gcp-config-api" {
  project = "${local.gcp_project}"
  service = "containeranalysis.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services = true
}
