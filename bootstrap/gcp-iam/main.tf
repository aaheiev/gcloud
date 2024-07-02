data "google_project" "gcloud_project" {
  project_id = var.gcloud_project
}

resource "google_service_account" "github_actions" {
 project      = data.google_project.gcloud_project.project_id
 account_id   = "github-actions"
 display_name = "Github Actions"
 description  = "Github Actions Service Account"
}

resource "google_service_account_key" "github_actions_key" {
  service_account_id = google_service_account.github_actions.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}
