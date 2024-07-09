locals {
  app_name      = "podinfo"
  app_image_url = "docker.io/stefanprodan/podinfo:6.7.0"
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_service_account" "service_account" {
  project      = data.google_project.gcloud_project.project_id
  account_id   = "${local.app_name}-cloud-run"
  display_name = "${local.app_name}-cloud-run"
  description  = "Service account used by ${local.app_name} Cloud Run service"
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_v2_service.cloud_run_service.location
  project     = google_cloud_run_v2_service.cloud_run_service.project
  service     = google_cloud_run_v2_service.cloud_run_service.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_cloud_run_v2_service" "cloud_run_service" {
  name     = local.app_name
  location = var.gcloud_region
  template {
    service_account = google_service_account.service_account.email
    timeout         = "60s"
    containers {
      name = "podinfo"
      image = local.app_image_url
      startup_probe {
        initial_delay_seconds = 10
        failure_threshold     = 5
        period_seconds        = 15
        timeout_seconds       = 3
        tcp_socket {
          port = 9898
        }
      }
      resources {
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
      }

      #       dynamic "env" {
      #         for_each = var.env_vars
      #         content {
      #           name = env.key
      #           value = env.value
      #         }
      #       }
    }
  }
  #   lifecycle {
  #     ignore_changes = [ template[0].containers[0].env ]
  #   }
}

# Service account(s) might not have enough permissions to deploy the integration. To mitigate potential errors, you can grant them the following roles:
# roles/compute.loadBalancerAdmin to 100043312804-compute@developer.gserviceaccount.com
# roles/compute.viewer to 100043312804-compute@developer.gserviceaccount.com
# roles/iam.serviceAccountUser to 100043312804-compute@developer.gserviceaccount.com
# roles/logging.bucketWriter to 100043312804-compute@developer.gserviceaccount.com
# roles/run.developer to 100043312804-compute@developer.gserviceaccount.com
# roles/storage.admin to 100043312804-compute@developer.gserviceaccount.com
