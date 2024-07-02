variable "gcloud_project" {
  type        = string
  description = "Main GCP project"
}

variable "gcloud_region" {
  type        = string
  description = "Main GCP region"
  default     = "europe-west4"
}

variable "gcr_repo_name_prefix" {
  type    = string
  default = "gcloud"
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_org_name" {
  type    = string
  default = "aaheiev"
}

variable "github_repo_name" {
  type    = string
  default = "gcloud-infra"
}
