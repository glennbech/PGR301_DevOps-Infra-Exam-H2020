resource "google_cloud_run_service" "hello" {
  name = "cloudrun-srv2"
  location = "us-central1"
  project = "pgr301-devops-exam-monster"

  template {
    spec {
      containers {
        image = "gcr.io/pgr301-devops-exam-monster/pgr301-exam-monsters:da33f7fbaa685cdf495f6c379fa9ec58e36eada4"
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