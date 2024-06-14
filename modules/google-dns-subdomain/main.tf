data "google_dns_managed_zone" "main_dns_zone" {
  name = var.main_dns_zone_name
}

resource "google_dns_managed_zone" "dns_zone" {
  name        = "${var.name}-${data.google_dns_managed_zone.main_dns_zone.name}"
  dns_name    = "${var.name}.${data.google_dns_managed_zone.main_dns_zone.dns_name}"
  description = var.description
  labels      = var.labels
}

resource "google_dns_record_set" "ns" {
  name         = "${var.name}.${data.google_dns_managed_zone.main_dns_zone.dns_name}"
  managed_zone = data.google_dns_managed_zone.main_dns_zone.name
  type         = "NS"
  ttl          = var.ns_ttl
  rrdatas      = google_dns_managed_zone.dns_zone.name_servers
}
