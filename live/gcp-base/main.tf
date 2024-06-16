locals {
  labels = {
    managed_by = "terraform"
    project    = "gcloud-infra"
    layer      = "gcp-base"
  }
  environment_name = terraform.workspace
}

module "config" {
  source           = "../../modules/config"
  environment_name = local.environment_name
  config_path      = "${path.root}/../../conf"
}
