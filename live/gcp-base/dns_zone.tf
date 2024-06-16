locals {
  create_dns_subdomain = module.config.environment["dns_subdomain"] == null ? false : true
  main_dns_zone_name   = module.config.global["main_dns_domain"]["name"]
}

module "dns_subdomain" {
  count = local.create_dns_subdomain ? 1 : 0
  source             = "../../modules/google-dns-subdomain"
  main_dns_zone_name = local.main_dns_zone_name
  name               = module.config.environment["dns_subdomain"]
  description        = "DNS zone for ${module.config.environment["description"]}"
  labels             = local.labels
}

locals {
  environment_dns_zone_name = module.config.environment["dns_subdomain"] == null ? local.main_dns_zone_name : module.dns_subdomain[0].dns_zone_name
}

output "environment_dns_zone_name" {
  value = local.environment_dns_zone_name
}
