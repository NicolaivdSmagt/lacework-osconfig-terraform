resource "google_compute_instance" "osconfig-test" {
  name         = "${local.gcp_compute_name}"
  machine_type = "${local.gcp_compute_type}"
  zone         = "${local.gcp_zone}"

  boot_disk {
    initialize_params {
      # Most modern Linux images include the OS Config agent. We'll use Debian Buster here.
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = "default"
  }
  metadata = {
    # This allows the instance to be managed by OS Config. You could add tags to manage to which instances the OS Config policy should apply.
    enable-osconfig = "TRUE"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "${local.gcp_service_account}"
    scopes = ["cloud-platform"]
  }
  allow_stopping_for_update = true
}
