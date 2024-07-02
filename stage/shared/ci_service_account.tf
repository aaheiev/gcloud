locals {
  ci_account_name         = "github-ci"
  ci_account_display_name = "Github CI Account"
  ci_account_description  = "Github CI Google Service Account"
}

resource "google_service_account" "github_actions" {
  project      = data.google_project.gcloud_project.project_id
  account_id   = local.ci_account_name
  display_name = local.ci_account_display_name
  description  = local.ci_account_description
}

resource "google_service_account_key" "github_actions_key" {
  service_account_id = google_service_account.github_actions.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

data "github_repository" "github_repo" {
  full_name = "${var.github_org_name}/${var.github_repo_name}"
}

resource "github_actions_secret" "ci_secret" {
  repository       = data.github_repository.github_repo.name
  secret_name      = "CI_PRIVATE_KEY"
  plaintext_value  = base64decode(google_service_account_key.github_actions_key.private_key)
}
