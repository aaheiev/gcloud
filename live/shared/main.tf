locals {
  labels = {
    managed_by = "terraform"
    project    = "gcloud-infra"
    layer      = "shared"
  }
  environment_name = terraform.workspace
}

module "config" {
  source           = "../../modules/config"
  environment_name = local.environment_name
  config_path      = "${path.root}/../../conf"
}

resource "google_dns_managed_zone" "main" {
  name        = module.config.global["main_dns_domain"]["name"]
  dns_name    = module.config.global["main_dns_domain"]["dns_name"]
  description = module.config.global["main_dns_domain"]["description"]
  labels      = local.labels
  dnssec_config {
    kind          = "dns#managedZoneDnsSecConfig"
    non_existence = "nsec3"
    state         = "on"
    default_key_specs {
      algorithm  = "rsasha256"
      key_length = 2048
      key_type   = "keySigning"
      kind       = "dns#dnsKeySpec"
    }
    default_key_specs {
      algorithm  = "rsasha256"
      key_length = 1024
      key_type   = "zoneSigning"
      kind       = "dns#dnsKeySpec"
    }
  }
}

output "main_dns_zone_name" {
  value = google_dns_managed_zone.main.name
}
