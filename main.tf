resource "google_cloud_run_service" "hello" {
  name = "cloudrun-srv2"
  location = "us-central1"
  project = "terraform-292215"

  template {
    spec {
      containers {
        image = "gcr.io/terraform-292215/helloworld@sha256:a910714e875838ce2ecceb3dbf29d0a40f0e9d083c2bca7ee8207a51beef8c18"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
        resources {
          limits = {
            memory: 512
          }
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.hello.location
  project = google_cloud_run_service.hello.project
  service = google_cloud_run_service.hello.name
  policy_data = data.google_iam_policy.noauth.policy_data
}