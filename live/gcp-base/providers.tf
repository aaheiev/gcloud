provider "google" {
  project = var.gcloud_progect
  region  = var.gcloud_region
}

provider "google-beta" {
  project = var.gcloud_progect
  region  = var.gcloud_region
}
