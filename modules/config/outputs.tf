module "runtime_config_deepmerge" {
  source  = "cloudposse/config/yaml//modules/deepmerge"
  version = "0.5.0"
  maps = [
    local.default_config,
    local.runtime_config
  ]
}

output "global" {
  value = local.global_config
}

output "environment" {
  value = module.runtime_config_deepmerge.merged
}
