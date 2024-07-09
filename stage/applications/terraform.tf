terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 5.36.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "= 5.36.0"
    }
#     local = {
#       source  = "hashicorp/local"
#       version = "= 2.5.1"
#     }
    random = {
      source  = "hashicorp/random"
      version = "= 3.6.2"
    }
#     github = {
#       source  = "integrations/github"
#       version = "= 6.2.2"
#     }
  }
}
