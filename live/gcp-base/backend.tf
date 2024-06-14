terraform {
  backend "gcs" {
    bucket = "infrastructure2023"
    prefix = "gcloud-infra/gcp-base"
  }
}
