terraform {
  required_version = "= 1.8.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.33.0, < 6.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.33.0, < 6.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "= 3.6.2"
    }
  }
}
