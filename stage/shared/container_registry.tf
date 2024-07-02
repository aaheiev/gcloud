resource "random_integer" "artifact_registry_name_suffix" {
  min = 10
  max = 99
}

locals {
  gcr_repo_name = "${var.gcr_repo_name_prefix}${random_integer.artifact_registry_name_suffix.result}"
}

resource "google_artifact_registry_repository" "artifact_registry" {
  location      = var.gcloud_region
  repository_id = local.gcr_repo_name
  description   = "container registry repository"
  format        = "DOCKER"
  #   docker_config {
  #     immutable_tags = true
  #   }
}

resource "google_artifact_registry_repository_iam_member" "artifact_registry_pusher" {
  location   = google_artifact_registry_repository.artifact_registry.location
  repository = google_artifact_registry_repository.artifact_registry.repository_id
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.github_actions.email}"
}
