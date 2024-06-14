locals {
  global_config  = yamldecode(file("${var.config_path}/global.yaml"))
  default_config = yamldecode(file("${var.config_path}/environments/default.yaml"))
  runtime_config = yamldecode(file("${var.config_path}/environments/${var.environment_name}.yaml"))
}

# data "sops_file" "runtime_secrets" {
#   source_file = "${path.module}/secrets.yaml"
# }
