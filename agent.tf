resource "google_os_config_os_policy_assignment" "install-lacework-agent" {

  project     = "${local.gcp_project}"
  location    = "${local.gcp_zone}"
  name        = "lacework-install-policy"
  description = "OS policy to install Lacework agent"

  instance_filter {
    all = true
  }

  os_policies {
    id   = "lacework-install-policy"
    mode = "ENFORCEMENT"

    resource_groups {
      resources {
        id = "apt-repo"
        repository {
          apt {
            uri          = "https://packages.lacework.net/latest/DEB/debian"
            archive_type = "DEB"
            distribution = "buster"
            components   = ["main"]
            gpg_key      = "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x360d55d76727556814078e25ff3e1d4dee0cc692"
          }
        }
      }
      resources {
        id = "apt-install"

        pkg {
          desired_state = "INSTALLED"

          apt {
            name = "lacework"
          }
        }
      }
      resources {
        id = "create-lacework-config"
        exec {
          validate {
            interpreter      = "SHELL"
            output_file_path = "/$HOME/os-policy-tf.out"
            script           = "if test -f /var/lib/lacework/config/config.json; then exit 100; else exit 101; fi"
          }
          enforce {
            interpreter      = "SHELL"
            output_file_path = "$HOME/os-policy-tf.out"
            script           = "echo '{\"Tokens\": {\"Accesstoken\": \"${lacework_agent_access_token.osconfig_deployment.token}\"}, \"serverurl\": \"${local.lacework_serverurl}\" }' > /var/lib/lacework/config/config.json && exit 100"
          }
        }
      }
    }
  }

  rollout {
    disruption_budget {
      fixed = 1
    }
    min_wait_duration = "3.5s"
  }
}
