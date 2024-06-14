remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "infrastructure2023"
    prefix = "gcloud-infra/${path_relative_to_include()}"
  }
}
