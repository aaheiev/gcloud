locals {
  labels = {
    managed-by = "terraform"
    project    = "gcloud-infra"
    layer      = "stage-shared"
  }
  environment_name = terraform.workspace
}

data "google_project" "gcloud_project" {
  project_id = var.gcloud_project
}
