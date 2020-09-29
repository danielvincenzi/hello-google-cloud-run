provider "google" {
  version = "3.5.0"
}

resource "google_cloud_run_service" "default" {
  name     = var.name
  location = var.region
  project  = var.project

  metadata {
    annotations = {
      "run.googleapis.com/client-name" = "terraform"
    }
  }

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  service  = google_cloud_run_service.default.name
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project

  policy_data = data.google_iam_policy.noauth.policy_data
}
