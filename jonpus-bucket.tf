resource "google_storage_bucket" "static-site" {
  project = "pgr301-devops-exam-infra"
  name = "pgr301-devops-infra-bucket12"
  location = "EU"
}