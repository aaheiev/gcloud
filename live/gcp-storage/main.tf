resource "random_integer" "bucket_suffix" {
  min  = 100
  max  = 999
  seed = terraform.workspace
}

locals {
  bucket_name = "charts-${terraform.workspace}${random_integer.bucket_suffix.result}"
  labels = {
    managed_by = "terraform"
    project    = "gcloud-infra"
    layer      = "gcp-storage"
  }
  environment_name = terraform.workspace
}

resource "google_storage_bucket" "chartmuseum_backend" {
  provider                 = google-beta
  name                     = local.bucket_name
  location                 = var.gcloud_region
  force_destroy            = false
  default_event_based_hold = false
  public_access_prevention = "enforced"
  storage_class            = "STANDARD"
  labels                   = local.labels
  soft_delete_policy {
    retention_duration_seconds = 0
  }
}

output "bucket_name" {
  value = google_storage_bucket.chartmuseum_backend.name
}
