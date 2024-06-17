terraform {
  backend "gcs" {
    bucket = "infrastructure2023"
    prefix = "gcloud-infra/live/gcp-base"
  }
}
